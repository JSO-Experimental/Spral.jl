# Wrapping headers

This directory contains a script that can be used to automatically generate wrappers from the C headers provided by SPRAL.
This is done using Clang.jl.

# Usage

Either run `julia wrapper.jl` directly, or include it and call the `main()` function.
Be sure to activate the project environment in this folder (`julia --project`), which will install `SPRAL_jll.jl`, `Clang.jl` and `JuliaFormatter.jl`.
The `main` function supports the boolean keyword argument `optimized` to clear the generated wrappers.
