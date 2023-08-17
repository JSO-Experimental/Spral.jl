mutable struct spral_lsmr_options
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

    spral_lsmr_options() = new()
end

mutable struct spral_lsmr_inform
    flag::Cint
    itn::Cint
    stat::Cint
    normb::Cdouble
    normAP::Cdouble
    condAP::Cdouble
    normr::Cdouble
    normAPr::Cdouble
    normy::Cdouble

    spral_lsmr_inform() = new()
end

function spral_lsmr_default_options(options)
    @ccall libspral.spral_lsmr_default_options(options::Ref{spral_lsmr_options})::Cvoid
end

function spral_lsmr_solve(action, m, n, u, v, y, keep, options, inform, damp)
    @ccall libspral.spral_lsmr_solve(action::Ptr{Cint}, m::Cint, n::Cint, u::Ptr{Cdouble},
                                     v::Ptr{Cdouble}, y::Ptr{Cdouble},
                                     keep::Ptr{Ptr{Cvoid}},
                                     options::Ref{spral_lsmr_options},
                                     inform::Ref{spral_lsmr_inform},
                                     damp::Ptr{Cdouble})::Cint
end

function spral_lsmr_free(keep)
    @ccall libspral.spral_lsmr_free(keep::Ptr{Ptr{Cvoid}})::Cint
end

@enum spral_matrix_type::Int32 begin
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

function spral_half_to_full_i64d(n, ptr, row, a, base)
    @ccall libspral.spral_half_to_full_i64d(n::Cint, ptr::Ptr{Int64}, row::Ptr{Cint},
                                            a::Ptr{Cdouble}, base::Cint)::Cvoid
end

function spral_print_matrix(lines, matrix_type, m, n, ptr, row, val, base)
    @ccall libspral.spral_print_matrix(lines::Cint, matrix_type::spral_matrix_type, m::Cint,
                                       n::Cint, ptr::Ptr{Cint}, row::Ptr{Cint},
                                       val::Ptr{Cdouble}, base::Cint)::Cvoid
end

function spral_print_matrix_i64d(lines, matrix_type, m, n, ptr, row, val, base)
    @ccall libspral.spral_print_matrix_i64d(lines::Cint, matrix_type::spral_matrix_type,
                                            m::Cint, n::Cint, ptr::Ptr{Int64},
                                            row::Ptr{Cint}, val::Ptr{Cdouble},
                                            base::Cint)::Cvoid
end

function spral_random_real(state, positive)
    @ccall libspral.spral_random_real(state::Ptr{Cint}, positive::Bool)::Cdouble
end

function spral_random_integer(state, n)
    @ccall libspral.spral_random_integer(state::Ptr{Cint}, n::Cint)::Cint
end

function spral_random_long(state, n)
    @ccall libspral.spral_random_long(state::Ptr{Cint}, n::Int64)::Int64
end

function spral_random_logical(state)
    @ccall libspral.spral_random_logical(state::Ptr{Cint})::Bool
end

function spral_random_matrix_generate(state, matrix_type, m, n, nnz, ptr, row, val, flags)
    @ccall libspral.spral_random_matrix_generate(state::Ptr{Cint},
                                                 matrix_type::spral_matrix_type, m::Cint,
                                                 n::Cint, nnz::Cint, ptr::Ptr{Cint},
                                                 row::Ptr{Cint}, val::Ptr{Cdouble},
                                                 flags::Cint)::Cint
end

function spral_random_matrix_generate_long(state, matrix_type, m, n, nnz, ptr, row, val,
                                           flags)
    @ccall libspral.spral_random_matrix_generate_long(state::Ptr{Cint},
                                                      matrix_type::spral_matrix_type,
                                                      m::Cint, n::Cint, nnz::Int64,
                                                      ptr::Ptr{Int64}, row::Ptr{Cint},
                                                      val::Ptr{Cdouble}, flags::Cint)::Cint
end

mutable struct spral_rb_read_options
    array_base::Cint
    add_diagonal::Bool
    extra_space::Cfloat
    lwr_upr_full::Cint
    values::Cint

    spral_rb_read_options() = new()
end

mutable struct spral_rb_write_options
    array_base::Cint
    val_format::NTuple{21,Cchar}

    spral_rb_write_options() = new()
end

function spral_rb_default_read_options(options)
    @ccall libspral.spral_rb_default_read_options(options::Ref{spral_rb_read_options})::Cvoid
end

function spral_rb_default_write_options(options)
    @ccall libspral.spral_rb_default_write_options(options::Ref{spral_rb_write_options})::Cvoid
end

function spral_rb_peek(filename, m, n, nelt, nvar, nval, matrix_type, type_code, title,
                       identifier)
    @ccall libspral.spral_rb_peek(filename::Cstring, m::Ptr{Cint}, n::Ptr{Cint},
                                  nelt::Ptr{Int64}, nvar::Ptr{Int64}, nval::Ptr{Int64},
                                  matrix_type::Ref{spral_matrix_type}, type_code::Cstring,
                                  title::Cstring, identifier::Cstring)::Cint
end

function spral_rb_read(filename, handle, matrix_type, m, n, ptr, row, val, options, title,
                       identifier, state)
    @ccall libspral.spral_rb_read(filename::Cstring, handle::Ptr{Ptr{Cvoid}},
                                  matrix_type::Ref{spral_matrix_type}, m::Ptr{Cint},
                                  n::Ptr{Cint}, ptr::Ptr{Ptr{Int64}}, row::Ptr{Ptr{Cint}},
                                  val::Ptr{Ptr{Cdouble}},
                                  options::Ref{spral_rb_read_options}, title::Cstring,
                                  identifier::Cstring, state::Ptr{Cint})::Cint
end

function spral_rb_read_ptr32(filename, handle, matrix_type, m, n, ptr, row, val, options,
                             title, identifier, state)
    @ccall libspral.spral_rb_read_ptr32(filename::Cstring, handle::Ptr{Ptr{Cvoid}},
                                        matrix_type::Ref{spral_matrix_type}, m::Ptr{Cint},
                                        n::Ptr{Cint}, ptr::Ptr{Ptr{Cint}},
                                        row::Ptr{Ptr{Cint}}, val::Ptr{Ptr{Cdouble}},
                                        options::Ref{spral_rb_read_options}, title::Cstring,
                                        identifier::Cstring, state::Ptr{Cint})::Cint
end

function spral_rb_write(filename, matrix_type, m, n, ptr, row, val, options, title,
                        identifier)
    @ccall libspral.spral_rb_write(filename::Cstring, matrix_type::spral_matrix_type,
                                   m::Cint, n::Cint, ptr::Ptr{Int64}, row::Ptr{Cint},
                                   val::Ptr{Cdouble}, options::Ref{spral_rb_write_options},
                                   title::Cstring, identifier::Cstring)::Cint
end

function spral_rb_write_ptr32(filename, matrix_type, m, n, ptr, row, val, options, title,
                              identifier)
    @ccall libspral.spral_rb_write_ptr32(filename::Cstring, matrix_type::spral_matrix_type,
                                         m::Cint, n::Cint, ptr::Ptr{Cint}, row::Ptr{Cint},
                                         val::Ptr{Cdouble},
                                         options::Ref{spral_rb_write_options},
                                         title::Cstring, identifier::Cstring)::Cint
end

function spral_rb_free_handle(handle)
    @ccall libspral.spral_rb_free_handle(handle::Ptr{Ptr{Cvoid}})::Cvoid
end

mutable struct spral_scaling_auction_options
    array_base::Cint
    max_iterations::Cint
    max_unchanged::NTuple{3,Cint}
    min_proportion::NTuple{3,Cfloat}
    eps_initial::Cfloat
    unused::NTuple{80,Cchar}

    spral_scaling_auction_options() = new()
end

mutable struct spral_scaling_auction_inform
    flag::Cint
    stat::Cint
    matched::Cint
    iterations::Cint
    unmatchable::Cint
    unused::NTuple{80,Cchar}

    spral_scaling_auction_inform() = new()
end

mutable struct spral_scaling_equilib_options
    array_base::Cint
    max_iterations::Cint
    tol::Cfloat
    unused::NTuple{80,Cchar}

    spral_scaling_equilib_options() = new()
end

mutable struct spral_scaling_equilib_inform
    flag::Cint
    stat::Cint
    iterations::Cint
    unused::NTuple{80,Cchar}

    spral_scaling_equilib_inform() = new()
end

mutable struct spral_scaling_hungarian_options
    array_base::Cint
    scale_if_singular::Bool
    unused::NTuple{80,Cchar}

    spral_scaling_hungarian_options() = new()
end

mutable struct spral_scaling_hungarian_inform
    flag::Cint
    stat::Cint
    matched::Cint
    unused::NTuple{80,Cchar}

    spral_scaling_hungarian_inform() = new()
end

function spral_scaling_auction_default_options(options)
    @ccall libspral.spral_scaling_auction_default_options(options::Ref{spral_scaling_auction_options})::Cvoid
end

function spral_scaling_equilib_default_options(options)
    @ccall libspral.spral_scaling_equilib_default_options(options::Ref{spral_scaling_equilib_options})::Cvoid
end

function spral_scaling_hungarian_default_options(options)
    @ccall libspral.spral_scaling_hungarian_default_options(options::Ref{spral_scaling_hungarian_options})::Cvoid
end

function spral_scaling_auction_sym(n, ptr, row, val, scaling, match, options, inform)
    @ccall libspral.spral_scaling_auction_sym(n::Cint, ptr::Ptr{Cint}, row::Ptr{Cint},
                                              val::Ptr{Cdouble}, scaling::Ptr{Cdouble},
                                              match::Ptr{Cint},
                                              options::Ref{spral_scaling_auction_options},
                                              inform::Ref{spral_scaling_auction_inform})::Cvoid
end

function spral_scaling_auction_sym_long(n, ptr, row, val, scaling, match, options, inform)
    @ccall libspral.spral_scaling_auction_sym_long(n::Cint, ptr::Ptr{Int64}, row::Ptr{Cint},
                                                   val::Ptr{Cdouble}, scaling::Ptr{Cdouble},
                                                   match::Ptr{Cint},
                                                   options::Ref{spral_scaling_auction_options},
                                                   inform::Ref{spral_scaling_auction_inform})::Cvoid
end

function spral_scaling_equilib_sym(n, ptr, row, val, scaling, options, inform)
    @ccall libspral.spral_scaling_equilib_sym(n::Cint, ptr::Ptr{Cint}, row::Ptr{Cint},
                                              val::Ptr{Cdouble}, scaling::Ptr{Cdouble},
                                              options::Ref{spral_scaling_equilib_options},
                                              inform::Ref{spral_scaling_equilib_inform})::Cvoid
end

function spral_scaling_equilib_sym_long(n, ptr, row, val, scaling, options, inform)
    @ccall libspral.spral_scaling_equilib_sym_long(n::Cint, ptr::Ptr{Int64}, row::Ptr{Cint},
                                                   val::Ptr{Cdouble}, scaling::Ptr{Cdouble},
                                                   options::Ref{spral_scaling_equilib_options},
                                                   inform::Ref{spral_scaling_equilib_inform})::Cvoid
end

function spral_scaling_hungarian_sym(n, ptr, row, val, scaling, match, options, inform)
    @ccall libspral.spral_scaling_hungarian_sym(n::Cint, ptr::Ptr{Cint}, row::Ptr{Cint},
                                                val::Ptr{Cdouble}, scaling::Ptr{Cdouble},
                                                match::Ptr{Cint},
                                                options::Ref{spral_scaling_hungarian_options},
                                                inform::Ref{spral_scaling_hungarian_inform})::Cvoid
end

function spral_scaling_hungarian_sym_long(n, ptr, row, val, scaling, match, options, inform)
    @ccall libspral.spral_scaling_hungarian_sym_long(n::Cint, ptr::Ptr{Int64},
                                                     row::Ptr{Cint}, val::Ptr{Cdouble},
                                                     scaling::Ptr{Cdouble},
                                                     match::Ptr{Cint},
                                                     options::Ref{spral_scaling_hungarian_options},
                                                     inform::Ref{spral_scaling_hungarian_inform})::Cvoid
end

function spral_scaling_auction_unsym(m, n, ptr, row, val, rscaling, cscaling, match,
                                     options, inform)
    @ccall libspral.spral_scaling_auction_unsym(m::Cint, n::Cint, ptr::Ptr{Cint},
                                                row::Ptr{Cint}, val::Ptr{Cdouble},
                                                rscaling::Ptr{Cdouble},
                                                cscaling::Ptr{Cdouble}, match::Ptr{Cint},
                                                options::Ref{spral_scaling_auction_options},
                                                inform::Ref{spral_scaling_auction_inform})::Cvoid
end

function spral_scaling_auction_unsym_long(m, n, ptr, row, val, rscaling, cscaling, match,
                                          options, inform)
    @ccall libspral.spral_scaling_auction_unsym_long(m::Cint, n::Cint, ptr::Ptr{Int64},
                                                     row::Ptr{Cint}, val::Ptr{Cdouble},
                                                     rscaling::Ptr{Cdouble},
                                                     cscaling::Ptr{Cdouble},
                                                     match::Ptr{Cint},
                                                     options::Ref{spral_scaling_auction_options},
                                                     inform::Ref{spral_scaling_auction_inform})::Cvoid
end

function spral_scaling_equilib_unsym(m, n, ptr, row, val, rscaling, cscaling, options,
                                     inform)
    @ccall libspral.spral_scaling_equilib_unsym(m::Cint, n::Cint, ptr::Ptr{Cint},
                                                row::Ptr{Cint}, val::Ptr{Cdouble},
                                                rscaling::Ptr{Cdouble},
                                                cscaling::Ptr{Cdouble},
                                                options::Ref{spral_scaling_equilib_options},
                                                inform::Ref{spral_scaling_equilib_inform})::Cvoid
end

function spral_scaling_equilib_unsym_long(m, n, ptr, row, val, rscaling, cscaling, options,
                                          inform)
    @ccall libspral.spral_scaling_equilib_unsym_long(m::Cint, n::Cint, ptr::Ptr{Int64},
                                                     row::Ptr{Cint}, val::Ptr{Cdouble},
                                                     rscaling::Ptr{Cdouble},
                                                     cscaling::Ptr{Cdouble},
                                                     options::Ref{spral_scaling_equilib_options},
                                                     inform::Ref{spral_scaling_equilib_inform})::Cvoid
end

function spral_scaling_hungarian_unsym(m, n, ptr, row, val, rscaling, cscaling, match,
                                       options, inform)
    @ccall libspral.spral_scaling_hungarian_unsym(m::Cint, n::Cint, ptr::Ptr{Cint},
                                                  row::Ptr{Cint}, val::Ptr{Cdouble},
                                                  rscaling::Ptr{Cdouble},
                                                  cscaling::Ptr{Cdouble}, match::Ptr{Cint},
                                                  options::Ref{spral_scaling_hungarian_options},
                                                  inform::Ref{spral_scaling_hungarian_inform})::Cvoid
end

function spral_scaling_hungarian_unsym_long(m, n, ptr, row, val, rscaling, cscaling, match,
                                            options, inform)
    @ccall libspral.spral_scaling_hungarian_unsym_long(m::Cint, n::Cint, ptr::Ptr{Int64},
                                                       row::Ptr{Cint}, val::Ptr{Cdouble},
                                                       rscaling::Ptr{Cdouble},
                                                       cscaling::Ptr{Cdouble},
                                                       match::Ptr{Cint},
                                                       options::Ref{spral_scaling_hungarian_options},
                                                       inform::Ref{spral_scaling_hungarian_inform})::Cvoid
end

mutable struct spral_ssids_options
    array_base::Cint
    print_level::Cint
    unit_diagnostics::Cint
    unit_error::Cint
    unit_warning::Cint
    ordering::Cint
    nemin::Cint
    ignore_numa::Bool
    use_gpu::Bool
    min_gpu_work::Int64
    max_load_inbalance::Cfloat
    gpu_perf_coeff::Cfloat
    scaling::Cint
    small_subtree_threshold::Int64
    cpu_block_size::Cint
    action::Bool
    pivot_method::Cint
    small::Cdouble
    u::Cdouble
    unused::NTuple{80,Cchar}

    spral_ssids_options() = new()
end

mutable struct spral_ssids_inform
    flag::Cint
    matrix_dup::Cint
    matrix_missing_diag::Cint
    matrix_outrange::Cint
    matrix_rank::Cint
    maxdepth::Cint
    maxfront::Cint
    num_delay::Cint
    num_factor::Int64
    num_flops::Int64
    num_neg::Cint
    num_sup::Cint
    num_two::Cint
    stat::Cint
    cuda_error::Cint
    cublas_error::Cint
    maxsupernode::Cint
    unused::NTuple{76,Cchar}

    spral_ssids_inform() = new()
end

function spral_ssids_default_options(options)
    @ccall libspral.spral_ssids_default_options(options::Ref{spral_ssids_options})::Cvoid
end

function spral_ssids_analyse(check, n, order, ptr, row, val, akeep, options, inform)
    @ccall libspral.spral_ssids_analyse(check::Bool, n::Cint, order::Ptr{Cint},
                                        ptr::Ptr{Int64}, row::Ptr{Cint}, val::Ptr{Cdouble},
                                        akeep::Ptr{Ptr{Cvoid}},
                                        options::Ref{spral_ssids_options},
                                        inform::Ref{spral_ssids_inform})::Cvoid
end

function spral_ssids_analyse_ptr32(check, n, order, ptr, row, val, akeep, options, inform)
    @ccall libspral.spral_ssids_analyse_ptr32(check::Bool, n::Cint, order::Ptr{Cint},
                                              ptr::Ptr{Cint}, row::Ptr{Cint},
                                              val::Ptr{Cdouble}, akeep::Ptr{Ptr{Cvoid}},
                                              options::Ref{spral_ssids_options},
                                              inform::Ref{spral_ssids_inform})::Cvoid
end

function spral_ssids_analyse_coord(n, order, ne, row, col, val, akeep, options, inform)
    @ccall libspral.spral_ssids_analyse_coord(n::Cint, order::Ptr{Cint}, ne::Int64,
                                              row::Ptr{Cint}, col::Ptr{Cint},
                                              val::Ptr{Cdouble}, akeep::Ptr{Ptr{Cvoid}},
                                              options::Ref{spral_ssids_options},
                                              inform::Ref{spral_ssids_inform})::Cvoid
end

function spral_ssids_factor(posdef, ptr, row, val, scale, akeep, fkeep, options, inform)
    @ccall libspral.spral_ssids_factor(posdef::Bool, ptr::Ptr{Int64}, row::Ptr{Cint},
                                       val::Ptr{Cdouble}, scale::Ptr{Cdouble},
                                       akeep::Ptr{Cvoid}, fkeep::Ptr{Ptr{Cvoid}},
                                       options::Ref{spral_ssids_options},
                                       inform::Ref{spral_ssids_inform})::Cvoid
end

function spral_ssids_factor_ptr32(posdef, ptr, row, val, scale, akeep, fkeep, options,
                                  inform)
    @ccall libspral.spral_ssids_factor_ptr32(posdef::Bool, ptr::Ptr{Cint}, row::Ptr{Cint},
                                             val::Ptr{Cdouble}, scale::Ptr{Cdouble},
                                             akeep::Ptr{Cvoid}, fkeep::Ptr{Ptr{Cvoid}},
                                             options::Ref{spral_ssids_options},
                                             inform::Ref{spral_ssids_inform})::Cvoid
end

function spral_ssids_solve1(job, x1, akeep, fkeep, options, inform)
    @ccall libspral.spral_ssids_solve1(job::Cint, x1::Ptr{Cdouble}, akeep::Ptr{Cvoid},
                                       fkeep::Ptr{Cvoid}, options::Ref{spral_ssids_options},
                                       inform::Ref{spral_ssids_inform})::Cvoid
end

function spral_ssids_solve(job, nrhs, x, ldx, akeep, fkeep, options, inform)
    @ccall libspral.spral_ssids_solve(job::Cint, nrhs::Cint, x::Ptr{Cdouble}, ldx::Cint,
                                      akeep::Ptr{Cvoid}, fkeep::Ptr{Cvoid},
                                      options::Ref{spral_ssids_options},
                                      inform::Ref{spral_ssids_inform})::Cvoid
end

function spral_ssids_free_akeep(akeep)
    @ccall libspral.spral_ssids_free_akeep(akeep::Ptr{Ptr{Cvoid}})::Cint
end

function spral_ssids_free_fkeep(fkeep)
    @ccall libspral.spral_ssids_free_fkeep(fkeep::Ptr{Ptr{Cvoid}})::Cint
end

function spral_ssids_free(akeep, fkeep)
    @ccall libspral.spral_ssids_free(akeep::Ptr{Ptr{Cvoid}}, fkeep::Ptr{Ptr{Cvoid}})::Cint
end

function spral_ssids_enquire_posdef(akeep, fkeep, options, inform, d)
    @ccall libspral.spral_ssids_enquire_posdef(akeep::Ptr{Cvoid}, fkeep::Ptr{Cvoid},
                                               options::Ref{spral_ssids_options},
                                               inform::Ref{spral_ssids_inform},
                                               d::Ptr{Cdouble})::Cvoid
end

function spral_ssids_enquire_indef(akeep, fkeep, options, inform, piv_order, d)
    @ccall libspral.spral_ssids_enquire_indef(akeep::Ptr{Cvoid}, fkeep::Ptr{Cvoid},
                                              options::Ref{spral_ssids_options},
                                              inform::Ref{spral_ssids_inform},
                                              piv_order::Ptr{Cint}, d::Ptr{Cdouble})::Cvoid
end

function spral_ssids_alter(d, akeep, fkeep, options, inform)
    @ccall libspral.spral_ssids_alter(d::Ptr{Cdouble}, akeep::Ptr{Cvoid}, fkeep::Ptr{Cvoid},
                                      options::Ref{spral_ssids_options},
                                      inform::Ref{spral_ssids_inform})::Cvoid
end

mutable struct spral_ssmfe_rcid
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
    unused::NTuple{80,Cchar}

    spral_ssmfe_rcid() = new()
end

mutable struct spral_ssmfe_rciz
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
    alpha::ComplexF32
    beta::ComplexF32
    x::Ptr{ComplexF32}
    y::Ptr{ComplexF32}
    unused::NTuple{80,Cchar}

    spral_ssmfe_rciz() = new()
end

mutable struct spral_ssmfe_core_options
    array_base::Cint
    cf_max::Cdouble
    err_est::Cint
    extra_left::Cint
    extra_right::Cint
    min_gap::Cdouble
    minAprod::Bool
    minBprod::Bool
    unused::NTuple{80,Cchar}

    spral_ssmfe_core_options() = new()
end

mutable struct spral_ssmfe_options
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
    minAprod::Bool
    minBprod::Bool

    spral_ssmfe_options() = new()
end

mutable struct spral_ssmfe_inform
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
    unused::NTuple{80,Cchar}

    spral_ssmfe_inform() = new()
end

function spral_ssmfe_default_options(options)
    @ccall libspral.spral_ssmfe_default_options(options::Ref{spral_ssmfe_options})::Cvoid
end

function spral_ssmfe_standard_double(rci, left, mep, lambda, n, x, ldx, keep, options,
                                     inform)
    @ccall libspral.spral_ssmfe_standard_double(rci::Ref{spral_ssmfe_rcid}, left::Cint,
                                                mep::Cint, lambda::Ptr{Cdouble}, n::Cint,
                                                x::Ptr{Cdouble}, ldx::Cint,
                                                keep::Ptr{Ptr{Cvoid}},
                                                options::Ref{spral_ssmfe_options},
                                                inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_standard_double_complex(rci, left, mep, lambda, n, x, ldx, keep,
                                             options, inform)
    @ccall libspral.spral_ssmfe_standard_double_complex(rci::Ref{spral_ssmfe_rciz},
                                                        left::Cint, mep::Cint,
                                                        lambda::Ptr{Cdouble}, n::Cint,
                                                        x::Ptr{ComplexF32},
                                                        ldx::Cint, keep::Ptr{Ptr{Cvoid}},
                                                        options::Ref{spral_ssmfe_options},
                                                        inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_standard_shift_double(rci, sigma, left, right, mep, lambda, n, x, ldx,
                                           keep, options, inform)
    @ccall libspral.spral_ssmfe_standard_shift_double(rci::Ref{spral_ssmfe_rcid},
                                                      sigma::Cdouble, left::Cint,
                                                      right::Cint, mep::Cint,
                                                      lambda::Ptr{Cdouble}, n::Cint,
                                                      x::Ptr{Cdouble}, ldx::Cint,
                                                      keep::Ptr{Ptr{Cvoid}},
                                                      options::Ref{spral_ssmfe_options},
                                                      inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_standard_shift_double_complex(rci, sigma, left, right, mep, lambda, n,
                                                   x, ldx, keep, options, inform)
    @ccall libspral.spral_ssmfe_standard_shift_double_complex(rci::Ref{spral_ssmfe_rciz},
                                                              sigma::Cdouble, left::Cint,
                                                              right::Cint, mep::Cint,
                                                              lambda::Ptr{Cdouble}, n::Cint,
                                                              x::Ptr{ComplexF32},
                                                              ldx::Cint,
                                                              keep::Ptr{Ptr{Cvoid}},
                                                              options::Ref{spral_ssmfe_options},
                                                              inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_generalized_double(rci, left, mep, lambda, n, x, ldx, keep, options,
                                        inform)
    @ccall libspral.spral_ssmfe_generalized_double(rci::Ref{spral_ssmfe_rcid}, left::Cint,
                                                   mep::Cint, lambda::Ptr{Cdouble}, n::Cint,
                                                   x::Ptr{Cdouble}, ldx::Cint,
                                                   keep::Ptr{Ptr{Cvoid}},
                                                   options::Ref{spral_ssmfe_options},
                                                   inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_generalized_double_complex(rci, left, mep, lambda, n, x, ldx, keep,
                                                options, inform)
    @ccall libspral.spral_ssmfe_generalized_double_complex(rci::Ref{spral_ssmfe_rciz},
                                                           left::Cint, mep::Cint,
                                                           lambda::Ptr{Cdouble}, n::Cint,
                                                           x::Ptr{ComplexF32},
                                                           ldx::Cint, keep::Ptr{Ptr{Cvoid}},
                                                           options::Ref{spral_ssmfe_options},
                                                           inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_generalized_shift_double(rci, sigma, left, right, mep, lambda, n, x,
                                              ldx, keep, options, inform)
    @ccall libspral.spral_ssmfe_generalized_shift_double(rci::Ref{spral_ssmfe_rcid},
                                                         sigma::Cdouble, left::Cint,
                                                         right::Cint, mep::Cint,
                                                         lambda::Ptr{Cdouble}, n::Cint,
                                                         x::Ptr{Cdouble}, ldx::Cint,
                                                         keep::Ptr{Ptr{Cvoid}},
                                                         options::Ref{spral_ssmfe_options},
                                                         inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_generalized_shift_double_complex(rci, sigma, left, right, mep, lambda,
                                                      n, x, ldx, keep, options, inform)
    @ccall libspral.spral_ssmfe_generalized_shift_double_complex(rci::Ref{spral_ssmfe_rciz},
                                                                 sigma::Cdouble, left::Cint,
                                                                 right::Cint, mep::Cint,
                                                                 lambda::Ptr{Cdouble},
                                                                 n::Cint,
                                                                 x::Ptr{ComplexF32},
                                                                 ldx::Cint,
                                                                 keep::Ptr{Ptr{Cvoid}},
                                                                 options::Ref{spral_ssmfe_options},
                                                                 inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_buckling_double(rci, sigma, left, right, mep, lambda, n, x, ldx, keep,
                                     options, inform)
    @ccall libspral.spral_ssmfe_buckling_double(rci::Ref{spral_ssmfe_rcid}, sigma::Cdouble,
                                                left::Cint, right::Cint, mep::Cint,
                                                lambda::Ptr{Cdouble}, n::Cint,
                                                x::Ptr{Cdouble}, ldx::Cint,
                                                keep::Ptr{Ptr{Cvoid}},
                                                options::Ref{spral_ssmfe_options},
                                                inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_buckling_double_complex(rci, sigma, left, right, mep, lambda, n, x,
                                             ldx, keep, options, inform)
    @ccall libspral.spral_ssmfe_buckling_double_complex(rci::Ref{spral_ssmfe_rciz},
                                                        sigma::Cdouble, left::Cint,
                                                        right::Cint, mep::Cint,
                                                        lambda::Ptr{Cdouble}, n::Cint,
                                                        x::Ptr{ComplexF32},
                                                        ldx::Cint, keep::Ptr{Ptr{Cvoid}},
                                                        options::Ref{spral_ssmfe_options},
                                                        inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_free_double(keep, inform)
    @ccall libspral.spral_ssmfe_free_double(keep::Ptr{Ptr{Cvoid}},
                                            inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_free_double_complex(keep, inform)
    @ccall libspral.spral_ssmfe_free_double_complex(keep::Ptr{Ptr{Cvoid}},
                                                    inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_expert_standard_double(rci, left, mep, lambda, m, rr, ind, keep,
                                            options, inform)
    @ccall libspral.spral_ssmfe_expert_standard_double(rci::Ref{spral_ssmfe_rcid},
                                                       left::Cint, mep::Cint,
                                                       lambda::Ptr{Cdouble}, m::Cint,
                                                       rr::Ptr{Cdouble}, ind::Ptr{Cint},
                                                       keep::Ptr{Ptr{Cvoid}},
                                                       options::Ref{spral_ssmfe_options},
                                                       inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_expert_standard_double_complex(rci, left, mep, lambda, m, rr, ind,
                                                    keep, options, inform)
    @ccall libspral.spral_ssmfe_expert_standard_double_complex(rci::Ref{spral_ssmfe_rciz},
                                                               left::Cint, mep::Cint,
                                                               lambda::Ptr{Cdouble},
                                                               m::Cint,
                                                               rr::Ptr{ComplexF32},
                                                               ind::Ptr{Cint},
                                                               keep::Ptr{Ptr{Cvoid}},
                                                               options::Ref{spral_ssmfe_options},
                                                               inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_expert_standard_shift_double(rci, sigma, left, right, mep, lambda, m,
                                                  rr, ind, keep, options, inform)
    @ccall libspral.spral_ssmfe_expert_standard_shift_double(rci::Ref{spral_ssmfe_rcid},
                                                             sigma::Cdouble, left::Cint,
                                                             right::Cint, mep::Cint,
                                                             lambda::Ptr{Cdouble}, m::Cint,
                                                             rr::Ptr{Cdouble},
                                                             ind::Ptr{Cint},
                                                             keep::Ptr{Ptr{Cvoid}},
                                                             options::Ref{spral_ssmfe_options},
                                                             inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_expert_standard_shift_double_complex(rci, sigma, left, right, mep,
                                                          lambda, m, rr, ind, keep, options,
                                                          inform)
    @ccall libspral.spral_ssmfe_expert_standard_shift_double_complex(rci::Ref{spral_ssmfe_rciz},
                                                                     sigma::Cdouble,
                                                                     left::Cint,
                                                                     right::Cint, mep::Cint,
                                                                     lambda::Ptr{Cdouble},
                                                                     m::Cint,
                                                                     rr::Ptr{ComplexF32},
                                                                     ind::Ptr{Cint},
                                                                     keep::Ptr{Ptr{Cvoid}},
                                                                     options::Ref{spral_ssmfe_options},
                                                                     inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_expert_generalized_double(rci, left, mep, lambda, m, rr, ind, keep,
                                               options, inform)
    @ccall libspral.spral_ssmfe_expert_generalized_double(rci::Ref{spral_ssmfe_rcid},
                                                          left::Cint, mep::Cint,
                                                          lambda::Ptr{Cdouble}, m::Cint,
                                                          rr::Ptr{Cdouble}, ind::Ptr{Cint},
                                                          keep::Ptr{Ptr{Cvoid}},
                                                          options::Ref{spral_ssmfe_options},
                                                          inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_expert_generalized_double_complex(rci, left, mep, lambda, m, rr, ind,
                                                       keep, options, inform)
    @ccall libspral.spral_ssmfe_expert_generalized_double_complex(rci::Ref{spral_ssmfe_rciz},
                                                                  left::Cint, mep::Cint,
                                                                  lambda::Ptr{Cdouble},
                                                                  m::Cint,
                                                                  rr::Ptr{ComplexF32},
                                                                  ind::Ptr{Cint},
                                                                  keep::Ptr{Ptr{Cvoid}},
                                                                  options::Ref{spral_ssmfe_options},
                                                                  inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_expert_generalized_shift_double(rci, sigma, left, right, mep, lambda,
                                                     m, rr, ind, keep, options, inform)
    @ccall libspral.spral_ssmfe_expert_generalized_shift_double(rci::Ref{spral_ssmfe_rcid},
                                                                sigma::Cdouble, left::Cint,
                                                                right::Cint, mep::Cint,
                                                                lambda::Ptr{Cdouble},
                                                                m::Cint, rr::Ptr{Cdouble},
                                                                ind::Ptr{Cint},
                                                                keep::Ptr{Ptr{Cvoid}},
                                                                options::Ref{spral_ssmfe_options},
                                                                inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_expert_generalized_shift_double_complex(rci, sigma, left, right, mep,
                                                             lambda, m, rr, ind, keep,
                                                             options, inform)
    @ccall libspral.spral_ssmfe_expert_generalized_shift_double_complex(rci::Ref{spral_ssmfe_rciz},
                                                                        sigma::Cdouble,
                                                                        left::Cint,
                                                                        right::Cint,
                                                                        mep::Cint,
                                                                        lambda::Ptr{Cdouble},
                                                                        m::Cint,
                                                                        rr::Ptr{ComplexF32},
                                                                        ind::Ptr{Cint},
                                                                        keep::Ptr{Ptr{Cvoid}},
                                                                        options::Ref{spral_ssmfe_options},
                                                                        inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_expert_buckling_double(rci, sigma, left, right, mep, lambda, m, rr,
                                            ind, keep, options, inform)
    @ccall libspral.spral_ssmfe_expert_buckling_double(rci::Ref{spral_ssmfe_rcid},
                                                       sigma::Cdouble, left::Cint,
                                                       right::Cint, mep::Cint,
                                                       lambda::Ptr{Cdouble}, m::Cint,
                                                       rr::Ptr{Cdouble}, ind::Ptr{Cint},
                                                       keep::Ptr{Ptr{Cvoid}},
                                                       options::Ref{spral_ssmfe_options},
                                                       inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_expert_buckling_double_complex(rci, sigma, left, right, mep, lambda, m,
                                                    rr, ind, keep, options, inform)
    @ccall libspral.spral_ssmfe_expert_buckling_double_complex(rci::Ref{spral_ssmfe_rciz},
                                                               sigma::Cdouble, left::Cint,
                                                               right::Cint, mep::Cint,
                                                               lambda::Ptr{Cdouble},
                                                               m::Cint,
                                                               rr::Ptr{ComplexF32},
                                                               ind::Ptr{Cint},
                                                               keep::Ptr{Ptr{Cvoid}},
                                                               options::Ref{spral_ssmfe_options},
                                                               inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_expert_free(keep, inform)
    @ccall libspral.spral_ssmfe_expert_free(keep::Ptr{Ptr{Cvoid}},
                                            inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_core_default_options(options)
    @ccall libspral.spral_ssmfe_core_default_options(options::Ref{spral_ssmfe_core_options})::Cvoid
end

function spral_ssmfe_double(rci, problem, left, right, m, lambda, rr, ind, keep, options,
                            inform)
    @ccall libspral.spral_ssmfe_double(rci::Ref{spral_ssmfe_rcid}, problem::Cint,
                                       left::Cint, right::Cint, m::Cint,
                                       lambda::Ptr{Cdouble}, rr::Ptr{Cdouble},
                                       ind::Ptr{Cint}, keep::Ptr{Ptr{Cvoid}},
                                       options::Ref{spral_ssmfe_core_options},
                                       inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_double_complex(rci, problem, left, right, m, lambda, rr, ind, keep,
                                    options, inform)
    @ccall libspral.spral_ssmfe_double_complex(rci::Ref{spral_ssmfe_rciz}, problem::Cint,
                                               left::Cint, right::Cint, m::Cint,
                                               lambda::Ptr{Cdouble},
                                               rr::Ptr{ComplexF32},
                                               ind::Ptr{Cint}, keep::Ptr{Ptr{Cvoid}},
                                               options::Ref{spral_ssmfe_core_options},
                                               inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_largest_double(rci, problem, nep, m, lambda, rr, ind, keep, options,
                                    inform)
    @ccall libspral.spral_ssmfe_largest_double(rci::Ref{spral_ssmfe_rcid}, problem::Cint,
                                               nep::Cint, m::Cint, lambda::Ptr{Cdouble},
                                               rr::Ptr{Cdouble}, ind::Ptr{Cint},
                                               keep::Ptr{Ptr{Cvoid}},
                                               options::Ref{spral_ssmfe_core_options},
                                               inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_largest_double_complex(rci, problem, nep, m, lambda, rr, ind, keep,
                                            options, inform)
    @ccall libspral.spral_ssmfe_largest_double_complex(rci::Ref{spral_ssmfe_rciz},
                                                       problem::Cint, nep::Cint, m::Cint,
                                                       lambda::Ptr{Cdouble},
                                                       rr::Ptr{ComplexF32},
                                                       ind::Ptr{Cint},
                                                       keep::Ptr{Ptr{Cvoid}},
                                                       options::Ref{spral_ssmfe_core_options},
                                                       inform::Ref{spral_ssmfe_inform})::Cvoid
end

function spral_ssmfe_core_free(keep, inform)
    @ccall libspral.spral_ssmfe_core_free(keep::Ptr{Ptr{Cvoid}},
                                          inform::Ref{spral_ssmfe_inform})::Cvoid
end
