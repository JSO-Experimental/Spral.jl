module Spral

using LinearAlgebra
using OpenBLAS32_jll
using SPRAL_jll

function __init__()
  config = LinearAlgebra.BLAS.lbt_get_config()
  if !any(lib -> lib.interface == :lp64, config.loaded_libs)
    LinearAlgebra.BLAS.lbt_forward(OpenBLAS32_jll.libopenblas_path)
  end
end

include("wrappers.jl")

end # module
