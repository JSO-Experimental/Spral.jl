# Script to parse HSL headers and generate Julia wrappers.
using SPRAL_jll
using Clang
using Clang.Generators
using JuliaFormatter

function rewrite!(path::String, optimized::Bool)
  text = read(path, String)
  text = replace(text, "struct" => "mutable struct")
  text = replace(text, "Ptr{spral" => "Ref{spral")
  write(path, text)
end

function main(; optimized::Bool=false)

  cd(@__DIR__)
  include = joinpath(SPRAL_jll.artifact_dir, "include")
  headers = [joinpath(include, "spral.h")]

  options = load_options(joinpath(@__DIR__, "spral.toml"))
  options["general"]["output_file_path"] = joinpath("..", "src", "wrappers.jl")

  args = get_default_args()
  push!(args, "-I$include")
  
  ctx = create_context(headers, args, options)
  build!(ctx)

  path = options["general"]["output_file_path"]
  format_file(path, YASStyle())
  rewrite!(path, optimized)
  return nothing
end

# If we want to use the file as a script with `julia wrapper.jl`
if abspath(PROGRAM_FILE) == @__FILE__
  main()
end
