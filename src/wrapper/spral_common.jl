# Automatically generated using Clang.jl
struct spral_lsmr_options
    atol::Cdouble
    btol::Cdouble
    conlim::Cdouble
    ctest::Cint
    itnlim::Cint
    itn_test::Cint
    localSize::Cint
    print_freq_head::Cint
    print_freq_itn::Cint
    unit_diagnostics::Cint
    unit_error::Cint
end

struct spral_lsmr_inform
    flag::Cint
    itn::Cint
    stat::Cint
    normb::Cdouble
    normAP::Cdouble
    condAP::Cdouble
    normr::Cdouble
    normAPr::Cdouble
    normy::Cdouble
end

@cenum spral_matrix_type::Int32 begin
    SPRAL_MATRIX_UNSPECIFIED = 0
    SPRAL_MATRIX_REAL_RECT = 1
    SPRAL_MATRIX_CPLX_RECT = -1
    SPRAL_MATRIX_REAL_UNSYM = 2
    SPRAL_MATRIX_CPLX_UNSYM = -2
    SPRAL_MATRIX_REAL_SYM_PSDEF = 3
    SPRAL_MATRIX_CPLX_HERM_PSDEF = -3
    SPRAL_MATRIX_REAL_SYM_INDEF = 4
    SPRAL_MATRIX_CPLX_HERM_INDEF = -4
    SPRAL_MATRIX_CPLX_SYM = -5
    SPRAL_MATRIX_REAL_SKEW = 6
    SPRAL_MATRIX_CPLX_SKEW = -6
end


const SPRAL_RANDOM_INITIAL_SEED = 486502
const SPRAL_RANDOM_MATRIX_FINDEX = 1
const SPRAL_RANDOM_MATRIX_NONSINGULAR = 2
const SPRAL_RANDOM_MATRIX_SORT = 4

struct spral_rb_read_options
    array_base::Cint
    add_diagonal::Cint
    extra_space::Cfloat
    lwr_upr_full::Cint
    values::Cint
end

struct spral_rb_write_options
    array_base::Cint
    val_format::NTuple{21, UInt8}
end

struct spral_scaling_auction_options
    array_base::Cint
    max_iterations::Cint
    max_unchanged::NTuple{3, Cint}
    min_proportion::NTuple{3, Cfloat}
    eps_initial::Cfloat
    unused::NTuple{80, UInt8}
end

struct spral_scaling_auction_inform
    flag::Cint
    stat::Cint
    matched::Cint
    iterations::Cint
    unmatchable::Cint
    unused::NTuple{80, UInt8}
end

struct spral_scaling_equilib_options
    array_base::Cint
    max_iterations::Cint
    tol::Cfloat
    unused::NTuple{80, UInt8}
end

struct spral_scaling_equilib_inform
    flag::Cint
    stat::Cint
    iterations::Cint
    unused::NTuple{80, UInt8}
end

struct spral_scaling_hungarian_options
    array_base::Cint
    scale_if_singular::Cint
    unused::NTuple{80, UInt8}
end

struct spral_scaling_hungarian_inform
    flag::Cint
    stat::Cint
    matched::Cint
    unused::NTuple{80, UInt8}
end

struct spral_ssids_options
    array_base::Cint
    print_level::Cint
    unit_diagnostics::Cint
    unit_error::Cint
    unit_warning::Cint
    ordering::Cint
    nemin::Cint
    ignore_numa::Cint
    use_gpu::Cint
    min_gpu_work::Clong
    max_load_inbalance::Cfloat
    gpu_perf_coeff::Cfloat
    scaling::Cint
    small_subtree_threshold::Clong
    cpu_block_size::Cint
    action::Cint
    pivot_method::Cint
    small::Cdouble
    u::Cdouble
    unused::NTuple{80, UInt8}
end

struct spral_ssids_inform
    flag::Cint
    matrix_dup::Cint
    matrix_missing_diag::Cint
    matrix_outrange::Cint
    matrix_rank::Cint
    maxdepth::Cint
    maxfront::Cint
    num_delay::Cint
    num_factor::Clong
    num_flops::Clong
    num_neg::Cint
    num_sup::Cint
    num_two::Cint
    stat::Cint
    cuda_error::Cint
    cublas_error::Cint
    unused::NTuple{80, UInt8}
end

struct spral_ssmfe_rcid
    job::Cint
    nx::Cint
    jx::Cint
    kx::Cint
    ny::Cint
    jy::Cint
    ky::Cint
    i::Cint
    j::Cint
    k::Cint
    alpha::Cdouble
    beta::Cdouble
    x::Ptr{Cdouble}
    y::Ptr{Cdouble}
    unused::NTuple{80, UInt8}
end

struct spral_ssmfe_rciz
    job::Cint
    nx::Cint
    jx::Cint
    kx::Cint
    ny::Cint
    jy::Cint
    ky::Cint
    i::Cint
    j::Cint
    k::Cint
    alpha::Cint
    beta::Cint
    x::Ptr{Cint}
    y::Ptr{Cint}
    unused::NTuple{80, UInt8}
end

struct spral_ssmfe_core_options
    array_base::Cint
    cf_max::Cdouble
    err_est::Cint
    extra_left::Cint
    extra_right::Cint
    min_gap::Cdouble
    minAprod::Cint
    minBprod::Cint
    unused::NTuple{80, UInt8}
end

struct spral_ssmfe_options
    array_base::Cint
    print_level::Cint
    unit_error::Cint
    unit_warning::Cint
    unit_diagnostic::Cint
    max_iterations::Cint
    user_x::Cint
    err_est::Cint
    abs_tol_lambda::Cdouble
    rel_tol_lambda::Cdouble
    abs_tol_residual::Cdouble
    rel_tol_residual::Cdouble
    tol_x::Cdouble
    left_gap::Cdouble
    right_gap::Cdouble
    extra_left::Cint
    extra_right::Cint
    max_left::Cint
    max_right::Cint
    minAprod::Cint
    minBprod::Cint
end

struct spral_ssmfe_inform
    flag::Cint
    stat::Cint
    non_converged::Cint
    iteration::Cint
    left::Cint
    right::Cint
    converged::Ptr{Cint}
    next_left::Cdouble
    next_right::Cdouble
    residual_norms::Ptr{Cdouble}
    err_lambda::Ptr{Cdouble}
    err_X::Ptr{Cdouble}
    unused::NTuple{80, UInt8}
end
