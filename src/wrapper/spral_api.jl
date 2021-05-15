# Julia wrapper for header: spral_lsmr.h
function spral_lsmr_default_options(options)
    ccall((:spral_lsmr_default_options, libspral), Cvoid, (Ptr{spral_lsmr_options},), options)
end

function spral_lsmr_solve(action, m, n, u, v, y, keep, options, inform, damp)
    ccall((:spral_lsmr_solve, libspral), Cint, (Ptr{Cint}, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{spral_lsmr_options}, Ptr{spral_lsmr_inform}, Ptr{Cdouble}), action, m, n, u, v, y, keep, options, inform, damp)
end

function spral_lsmr_free(keep)
    ccall((:spral_lsmr_free, libspral), Cint, (Ptr{Ptr{Cvoid}},), keep)
end


# Julia wrapper for header: spral_matrix_util.h
function spral_half_to_full_i64d(n, ptr, row, a, base)
    ccall((:spral_half_to_full_i64d, libspral), Cvoid, (Cint, Ptr{Clong}, Ptr{Cint}, Ptr{Cdouble}, Cint), n, ptr, row, a, base)
end

function spral_print_matrix(lines, matrix_type, m, n, ptr, row, val, base)
    ccall((:spral_print_matrix, libspral), Cvoid, (Cint, spral_matrix_type, Cint, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint), lines, matrix_type, m, n, ptr, row, val, base)
end

function spral_print_matrix_i64d(lines, matrix_type, m, n, ptr, row, val, base)
    ccall((:spral_print_matrix_i64d, libspral), Cvoid, (Cint, spral_matrix_type, Cint, Cint, Ptr{Clong}, Ptr{Cint}, Ptr{Cdouble}, Cint), lines, matrix_type, m, n, ptr, row, val, base)
end


# Julia wrapper for header: spral_random.h
function spral_random_real(state, positive)
    ccall((:spral_random_real, libspral), Cdouble, (Ptr{Cint}, Cint), state, positive)
end

function spral_random_integer(state, n)
    ccall((:spral_random_integer, libspral), Cint, (Ptr{Cint}, Cint), state, n)
end

function spral_random_long(state, n)
    ccall((:spral_random_long, libspral), Clong, (Ptr{Cint}, Clong), state, n)
end

function spral_random_logical()
    ccall((:spral_random_logical, libspral), Cint, ())
end


# Julia wrapper for header: spral_random_matrix.h
function spral_random_matrix_generate(state, matrix_type, m, n, nnz, ptr, row, val, flags)
    ccall((:spral_random_matrix_generate, libspral), Cint, (Ptr{Cint}, spral_matrix_type, Cint, Cint, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Cint), state, matrix_type, m, n, nnz, ptr, row, val, flags)
end

function spral_random_matrix_generate_long(state, matrix_type, m, n, nnz, ptr, row, val, flags)
    ccall((:spral_random_matrix_generate_long, libspral), Cint, (Ptr{Cint}, spral_matrix_type, Cint, Cint, Clong, Ptr{Clong}, Ptr{Cint}, Ptr{Cdouble}, Cint), state, matrix_type, m, n, nnz, ptr, row, val, flags)
end


# Julia wrapper for header: spral_rutherford_boeing.h
function spral_rb_default_read_options(options)
    ccall((:spral_rb_default_read_options, libspral), Cvoid, (Ptr{spral_rb_read_options},), options)
end

function spral_rb_default_write_options(options)
    ccall((:spral_rb_default_write_options, libspral), Cvoid, (Ptr{spral_rb_write_options},), options)
end

function spral_rb_peek(filename, m, n, nelt, nvar, nval, matrix_type, type_code, title, identifier)
    ccall((:spral_rb_peek, libspral), Cint, (Cstring, Ptr{Cint}, Ptr{Cint}, Ptr{Clong}, Ptr{Clong}, Ptr{Clong}, Ptr{spral_matrix_type}, Cstring, Cstring, Cstring), filename, m, n, nelt, nvar, nval, matrix_type, type_code, title, identifier)
end

function spral_rb_read(filename, handle, matrix_type, m, n, ptr, row, val, options, title, identifier, state)
    ccall((:spral_rb_read, libspral), Cint, (Cstring, Ptr{Ptr{Cvoid}}, Ptr{spral_matrix_type}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Clong}}, Ptr{Ptr{Cint}}, Ptr{Ptr{Cdouble}}, Ptr{spral_rb_read_options}, Cstring, Cstring, Ptr{Cint}), filename, handle, matrix_type, m, n, ptr, row, val, options, title, identifier, state)
end

function spral_rb_read_ptr32(filename, handle, matrix_type, m, n, ptr, row, val, options, title, identifier, state)
    ccall((:spral_rb_read_ptr32, libspral), Cint, (Cstring, Ptr{Ptr{Cvoid}}, Ptr{spral_matrix_type}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cint}}, Ptr{Ptr{Cint}}, Ptr{Ptr{Cdouble}}, Ptr{spral_rb_read_options}, Cstring, Cstring, Ptr{Cint}), filename, handle, matrix_type, m, n, ptr, row, val, options, title, identifier, state)
end

function spral_rb_write(filename, matrix_type, m, n, ptr, row, val, options, title, identifier)
    ccall((:spral_rb_write, libspral), Cint, (Cstring, spral_matrix_type, Cint, Cint, Ptr{Clong}, Ptr{Cint}, Ptr{Cdouble}, Ptr{spral_rb_write_options}, Cstring, Cstring), filename, matrix_type, m, n, ptr, row, val, options, title, identifier)
end

function spral_rb_write_ptr32(filename, matrix_type, m, n, ptr, row, val, options, title, identifier)
    ccall((:spral_rb_write_ptr32, libspral), Cint, (Cstring, spral_matrix_type, Cint, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{spral_rb_write_options}, Cstring, Cstring), filename, matrix_type, m, n, ptr, row, val, options, title, identifier)
end

function spral_rb_free_handle(handle)
    ccall((:spral_rb_free_handle, libspral), Cvoid, (Ptr{Ptr{Cvoid}},), handle)
end


# Julia wrapper for header: spral_scaling.h
function spral_scaling_auction_default_options(options)
    ccall((:spral_scaling_auction_default_options, libspral), Cvoid, (Ptr{spral_scaling_auction_options},), options)
end

function spral_scaling_equilib_default_options(options)
    ccall((:spral_scaling_equilib_default_options, libspral), Cvoid, (Ptr{spral_scaling_equilib_options},), options)
end

function spral_scaling_hungarian_default_options(options)
    ccall((:spral_scaling_hungarian_default_options, libspral), Cvoid, (Ptr{spral_scaling_hungarian_options},), options)
end

function spral_scaling_auction_sym(n, ptr, row, val, scaling, match, options, inform)
    ccall((:spral_scaling_auction_sym, libspral), Cvoid, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{spral_scaling_auction_options}, Ptr{spral_scaling_auction_inform}), n, ptr, row, val, scaling, match, options, inform)
end

function spral_scaling_auction_sym_long(n, ptr, row, val, scaling, match, options, inform)
    ccall((:spral_scaling_auction_sym_long, libspral), Cvoid, (Cint, Ptr{Clong}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{spral_scaling_auction_options}, Ptr{spral_scaling_auction_inform}), n, ptr, row, val, scaling, match, options, inform)
end

function spral_scaling_equilib_sym(n, ptr, row, val, scaling, options, inform)
    ccall((:spral_scaling_equilib_sym, libspral), Cvoid, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{spral_scaling_equilib_options}, Ptr{spral_scaling_equilib_inform}), n, ptr, row, val, scaling, options, inform)
end

function spral_scaling_equilib_sym_long(n, ptr, row, val, scaling, options, inform)
    ccall((:spral_scaling_equilib_sym_long, libspral), Cvoid, (Cint, Ptr{Clong}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{spral_scaling_equilib_options}, Ptr{spral_scaling_equilib_inform}), n, ptr, row, val, scaling, options, inform)
end

function spral_scaling_hungarian_sym(n, ptr, row, val, scaling, match, options, inform)
    ccall((:spral_scaling_hungarian_sym, libspral), Cvoid, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{spral_scaling_hungarian_options}, Ptr{spral_scaling_hungarian_inform}), n, ptr, row, val, scaling, match, options, inform)
end

function spral_scaling_hungarian_sym_long(n, ptr, row, val, scaling, match, options, inform)
    ccall((:spral_scaling_hungarian_sym_long, libspral), Cvoid, (Cint, Ptr{Clong}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{spral_scaling_hungarian_options}, Ptr{spral_scaling_hungarian_inform}), n, ptr, row, val, scaling, match, options, inform)
end

function spral_scaling_auction_unsym(m, n, ptr, row, val, rscaling, cscaling, match, options, inform)
    ccall((:spral_scaling_auction_unsym, libspral), Cvoid, (Cint, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{spral_scaling_auction_options}, Ptr{spral_scaling_auction_inform}), m, n, ptr, row, val, rscaling, cscaling, match, options, inform)
end

function spral_scaling_auction_unsym_long(m, n, ptr, row, val, rscaling, cscaling, match, options, inform)
    ccall((:spral_scaling_auction_unsym_long, libspral), Cvoid, (Cint, Cint, Ptr{Clong}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{spral_scaling_auction_options}, Ptr{spral_scaling_auction_inform}), m, n, ptr, row, val, rscaling, cscaling, match, options, inform)
end

function spral_scaling_equilib_unsym(m, n, ptr, row, val, rscaling, cscaling, options, inform)
    ccall((:spral_scaling_equilib_unsym, libspral), Cvoid, (Cint, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{spral_scaling_equilib_options}, Ptr{spral_scaling_equilib_inform}), m, n, ptr, row, val, rscaling, cscaling, options, inform)
end

function spral_scaling_equilib_unsym_long(m, n, ptr, row, val, rscaling, cscaling, options, inform)
    ccall((:spral_scaling_equilib_unsym_long, libspral), Cvoid, (Cint, Cint, Ptr{Clong}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{spral_scaling_equilib_options}, Ptr{spral_scaling_equilib_inform}), m, n, ptr, row, val, rscaling, cscaling, options, inform)
end

function spral_scaling_hungarian_unsym(m, n, ptr, row, val, rscaling, cscaling, match, options, inform)
    ccall((:spral_scaling_hungarian_unsym, libspral), Cvoid, (Cint, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{spral_scaling_hungarian_options}, Ptr{spral_scaling_hungarian_inform}), m, n, ptr, row, val, rscaling, cscaling, match, options, inform)
end

function spral_scaling_hungarian_unsym_long(m, n, ptr, row, val, rscaling, cscaling, match, options, inform)
    ccall((:spral_scaling_hungarian_unsym_long, libspral), Cvoid, (Cint, Cint, Ptr{Clong}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{spral_scaling_hungarian_options}, Ptr{spral_scaling_hungarian_inform}), m, n, ptr, row, val, rscaling, cscaling, match, options, inform)
end


# Julia wrapper for header: spral_ssids.h
function spral_ssids_default_options(options)
    ccall((:spral_ssids_default_options, libspral), Cvoid, (Ptr{spral_ssids_options},), options)
end

function spral_ssids_analyse(check, n, order, ptr, row, val, akeep, options, inform)
    ccall((:spral_ssids_analyse, libspral), Cvoid, (Cint, Cint, Ptr{Cint}, Ptr{Clong}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssids_options}, Ptr{spral_ssids_inform}), check, n, order, ptr, row, val, akeep, options, inform)
end

function spral_ssids_analyse_ptr32(check, n, order, ptr, row, val, akeep, options, inform)
    ccall((:spral_ssids_analyse_ptr32, libspral), Cvoid, (Cint, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssids_options}, Ptr{spral_ssids_inform}), check, n, order, ptr, row, val, akeep, options, inform)
end

function spral_ssids_analyse_coord(n, order, ne, row, col, val, akeep, options, inform)
    ccall((:spral_ssids_analyse_coord, libspral), Cvoid, (Cint, Ptr{Cint}, Clong, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssids_options}, Ptr{spral_ssids_inform}), n, order, ne, row, col, val, akeep, options, inform)
end

function spral_ssids_factor(posdef, ptr, row, val, scale, akeep, fkeep, options, inform)
    ccall((:spral_ssids_factor, libspral), Cvoid, (Cint, Ptr{Clong}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssids_options}, Ptr{spral_ssids_inform}), posdef, ptr, row, val, scale, akeep, fkeep, options, inform)
end

function spral_ssids_factor_ptr32(posdef, ptr, row, val, scale, akeep, fkeep, options, inform)
    ccall((:spral_ssids_factor_ptr32, libspral), Cvoid, (Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssids_options}, Ptr{spral_ssids_inform}), posdef, ptr, row, val, scale, akeep, fkeep, options, inform)
end

function spral_ssids_solve1(job, x1, akeep, fkeep, options, inform)
    ccall((:spral_ssids_solve1, libspral), Cvoid, (Cint, Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{spral_ssids_options}, Ptr{spral_ssids_inform}), job, x1, akeep, fkeep, options, inform)
end

function spral_ssids_solve(job, nrhs, x, ldx, akeep, fkeep, options, inform)
    ccall((:spral_ssids_solve, libspral), Cvoid, (Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{spral_ssids_options}, Ptr{spral_ssids_inform}), job, nrhs, x, ldx, akeep, fkeep, options, inform)
end

function spral_ssids_free_akeep(akeep)
    ccall((:spral_ssids_free_akeep, libspral), Cint, (Ptr{Ptr{Cvoid}},), akeep)
end

function spral_ssids_free_fkeep(fkeep)
    ccall((:spral_ssids_free_fkeep, libspral), Cint, (Ptr{Ptr{Cvoid}},), fkeep)
end

function spral_ssids_free(akeep, fkeep)
    ccall((:spral_ssids_free, libspral), Cint, (Ptr{Ptr{Cvoid}}, Ptr{Ptr{Cvoid}}), akeep, fkeep)
end

function spral_ssids_enquire_posdef(akeep, fkeep, options, inform, d)
    ccall((:spral_ssids_enquire_posdef, libspral), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{spral_ssids_options}, Ptr{spral_ssids_inform}, Ptr{Cdouble}), akeep, fkeep, options, inform, d)
end

function spral_ssids_enquire_indef(akeep, fkeep, options, inform, piv_order, d)
    ccall((:spral_ssids_enquire_indef, libspral), Cvoid, (Ptr{Cvoid}, Ptr{Cvoid}, Ptr{spral_ssids_options}, Ptr{spral_ssids_inform}, Ptr{Cint}, Ptr{Cdouble}), akeep, fkeep, options, inform, piv_order, d)
end

function spral_ssids_alter(d, akeep, fkeep, options, inform)
    ccall((:spral_ssids_alter, libspral), Cvoid, (Ptr{Cdouble}, Ptr{Cvoid}, Ptr{Cvoid}, Ptr{spral_ssids_options}, Ptr{spral_ssids_inform}), d, akeep, fkeep, options, inform)
end


# Julia wrapper for header: spral_ssmfe.h
function spral_ssmfe_default_options(options)
    ccall((:spral_ssmfe_default_options, libspral), Cvoid, (Ptr{spral_ssmfe_options},), options)
end

function spral_ssmfe_standard_double(rci, left, mep, lambda, n, x, ldx, keep, options, inform)
    ccall((:spral_ssmfe_standard_double, libspral), Cvoid, (Ptr{spral_ssmfe_rcid}, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cdouble}, Cint, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, left, mep, lambda, n, x, ldx, keep, options, inform)
end

function spral_ssmfe_standard_double_complex(rci, left, mep, lambda, n, x, ldx, keep, options, inform)
    ccall((:spral_ssmfe_standard_double_complex, libspral), Cvoid, (Ptr{spral_ssmfe_rciz}, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cint}, Cint, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, left, mep, lambda, n, x, ldx, keep, options, inform)
end

function spral_ssmfe_standard_shift_double(rci, sigma, left, right, mep, lambda, n, x, ldx, keep, options, inform)
    ccall((:spral_ssmfe_standard_shift_double, libspral), Cvoid, (Ptr{spral_ssmfe_rcid}, Cdouble, Cint, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cdouble}, Cint, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, sigma, left, right, mep, lambda, n, x, ldx, keep, options, inform)
end

function spral_ssmfe_standard_shift_double_complex(rci, sigma, left, right, mep, lambda, n, x, ldx, keep, options, inform)
    ccall((:spral_ssmfe_standard_shift_double_complex, libspral), Cvoid, (Ptr{spral_ssmfe_rciz}, Cdouble, Cint, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cint}, Cint, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, sigma, left, right, mep, lambda, n, x, ldx, keep, options, inform)
end

function spral_ssmfe_generalized_double(rci, left, mep, lambda, n, x, ldx, keep, options, inform)
    ccall((:spral_ssmfe_generalized_double, libspral), Cvoid, (Ptr{spral_ssmfe_rcid}, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cdouble}, Cint, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, left, mep, lambda, n, x, ldx, keep, options, inform)
end

function spral_ssmfe_generalized_double_complex(rci, left, mep, lambda, n, x, ldx, keep, options, inform)
    ccall((:spral_ssmfe_generalized_double_complex, libspral), Cvoid, (Ptr{spral_ssmfe_rciz}, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cint}, Cint, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, left, mep, lambda, n, x, ldx, keep, options, inform)
end

function spral_ssmfe_generalized_shift_double(rci, sigma, left, right, mep, lambda, n, x, ldx, keep, options, inform)
    ccall((:spral_ssmfe_generalized_shift_double, libspral), Cvoid, (Ptr{spral_ssmfe_rcid}, Cdouble, Cint, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cdouble}, Cint, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, sigma, left, right, mep, lambda, n, x, ldx, keep, options, inform)
end

function spral_ssmfe_generalized_shift_double_complex(rci, sigma, left, right, mep, lambda, n, x, ldx, keep, options, inform)
    ccall((:spral_ssmfe_generalized_shift_double_complex, libspral), Cvoid, (Ptr{spral_ssmfe_rciz}, Cdouble, Cint, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cint}, Cint, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, sigma, left, right, mep, lambda, n, x, ldx, keep, options, inform)
end

function spral_ssmfe_buckling_double(rci, sigma, left, right, mep, lambda, n, x, ldx, keep, options, inform)
    ccall((:spral_ssmfe_buckling_double, libspral), Cvoid, (Ptr{spral_ssmfe_rcid}, Cdouble, Cint, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cdouble}, Cint, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, sigma, left, right, mep, lambda, n, x, ldx, keep, options, inform)
end

function spral_ssmfe_buckling_double_complex(rci, sigma, left, right, mep, lambda, n, x, ldx, keep, options, inform)
    ccall((:spral_ssmfe_buckling_double_complex, libspral), Cvoid, (Ptr{spral_ssmfe_rciz}, Cdouble, Cint, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cint}, Cint, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, sigma, left, right, mep, lambda, n, x, ldx, keep, options, inform)
end

function spral_ssmfe_free_double(keep, inform)
    ccall((:spral_ssmfe_free_double, libspral), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_inform}), keep, inform)
end

function spral_ssmfe_free_double_complex(keep, inform)
    ccall((:spral_ssmfe_free_double_complex, libspral), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_inform}), keep, inform)
end

function spral_ssmfe_expert_standard_double(rci, left, mep, lambda, m, rr, ind, keep, options, inform)
    ccall((:spral_ssmfe_expert_standard_double, libspral), Cvoid, (Ptr{spral_ssmfe_rcid}, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, left, mep, lambda, m, rr, ind, keep, options, inform)
end

function spral_ssmfe_expert_standard_double_complex(rci, left, mep, lambda, m, rr, ind, keep, options, inform)
    ccall((:spral_ssmfe_expert_standard_double_complex, libspral), Cvoid, (Ptr{spral_ssmfe_rciz}, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, left, mep, lambda, m, rr, ind, keep, options, inform)
end

function spral_ssmfe_expert_standard_shift_double(rci, sigma, left, right, mep, lambda, m, rr, ind, keep, options, inform)
    ccall((:spral_ssmfe_expert_standard_shift_double, libspral), Cvoid, (Ptr{spral_ssmfe_rcid}, Cdouble, Cint, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, sigma, left, right, mep, lambda, m, rr, ind, keep, options, inform)
end

function spral_ssmfe_expert_standard_shift_double_complex(rci, sigma, left, right, mep, lambda, m, rr, ind, keep, options, inform)
    ccall((:spral_ssmfe_expert_standard_shift_double_complex, libspral), Cvoid, (Ptr{spral_ssmfe_rciz}, Cdouble, Cint, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, sigma, left, right, mep, lambda, m, rr, ind, keep, options, inform)
end

function spral_ssmfe_expert_generalized_double(rci, left, mep, lambda, m, rr, ind, keep, options, inform)
    ccall((:spral_ssmfe_expert_generalized_double, libspral), Cvoid, (Ptr{spral_ssmfe_rcid}, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, left, mep, lambda, m, rr, ind, keep, options, inform)
end

function spral_ssmfe_expert_generalized_double_complex(rci, left, mep, lambda, m, rr, ind, keep, options, inform)
    ccall((:spral_ssmfe_expert_generalized_double_complex, libspral), Cvoid, (Ptr{spral_ssmfe_rciz}, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, left, mep, lambda, m, rr, ind, keep, options, inform)
end

function spral_ssmfe_expert_generalized_shift_double(rci, sigma, left, right, mep, lambda, m, rr, ind, keep, options, inform)
    ccall((:spral_ssmfe_expert_generalized_shift_double, libspral), Cvoid, (Ptr{spral_ssmfe_rcid}, Cdouble, Cint, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, sigma, left, right, mep, lambda, m, rr, ind, keep, options, inform)
end

function spral_ssmfe_expert_generalized_shift_double_complex(rci, sigma, left, right, mep, lambda, m, rr, ind, keep, options, inform)
    ccall((:spral_ssmfe_expert_generalized_shift_double_complex, libspral), Cvoid, (Ptr{spral_ssmfe_rciz}, Cdouble, Cint, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, sigma, left, right, mep, lambda, m, rr, ind, keep, options, inform)
end

function spral_ssmfe_expert_buckling_double(rci, sigma, left, right, mep, lambda, m, rr, ind, keep, options, inform)
    ccall((:spral_ssmfe_expert_buckling_double, libspral), Cvoid, (Ptr{spral_ssmfe_rcid}, Cdouble, Cint, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, sigma, left, right, mep, lambda, m, rr, ind, keep, options, inform)
end

function spral_ssmfe_expert_buckling_double_complex(rci, sigma, left, right, mep, lambda, m, rr, ind, keep, options, inform)
    ccall((:spral_ssmfe_expert_buckling_double_complex, libspral), Cvoid, (Ptr{spral_ssmfe_rciz}, Cdouble, Cint, Cint, Cint, Ptr{Cdouble}, Cint, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_options}, Ptr{spral_ssmfe_inform}), rci, sigma, left, right, mep, lambda, m, rr, ind, keep, options, inform)
end

function spral_ssmfe_expert_free(keep, inform)
    ccall((:spral_ssmfe_expert_free, libspral), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_inform}), keep, inform)
end

function spral_ssmfe_core_default_options(options)
    ccall((:spral_ssmfe_core_default_options, libspral), Cvoid, (Ptr{spral_ssmfe_core_options},), options)
end

function spral_ssmfe_double(rci, problem, left, right, m, lambda, rr, ind, keep, options, inform)
    ccall((:spral_ssmfe_double, libspral), Cvoid, (Ptr{spral_ssmfe_rcid}, Cint, Cint, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_core_options}, Ptr{spral_ssmfe_inform}), rci, problem, left, right, m, lambda, rr, ind, keep, options, inform)
end

function spral_ssmfe_double_complex(rci, problem, left, right, m, lambda, rr, ind, keep, options, inform)
    ccall((:spral_ssmfe_double_complex, libspral), Cvoid, (Ptr{spral_ssmfe_rciz}, Cint, Cint, Cint, Cint, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_core_options}, Ptr{spral_ssmfe_inform}), rci, problem, left, right, m, lambda, rr, ind, keep, options, inform)
end

function spral_ssmfe_largest_double(rci, problem, nep, m, lambda, rr, ind, keep, options, inform)
    ccall((:spral_ssmfe_largest_double, libspral), Cvoid, (Ptr{spral_ssmfe_rcid}, Cint, Cint, Cint, Ptr{Cdouble}, Ptr{Cdouble}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_core_options}, Ptr{spral_ssmfe_inform}), rci, problem, nep, m, lambda, rr, ind, keep, options, inform)
end

function spral_ssmfe_largest_double_complex(rci, problem, nep, m, lambda, rr, ind, keep, options, inform)
    ccall((:spral_ssmfe_largest_double_complex, libspral), Cvoid, (Ptr{spral_ssmfe_rciz}, Cint, Cint, Cint, Ptr{Cdouble}, Ptr{Cint}, Ptr{Cint}, Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_core_options}, Ptr{spral_ssmfe_inform}), rci, problem, nep, m, lambda, rr, ind, keep, options, inform)
end

function spral_ssmfe_core_free(keep, inform)
    ccall((:spral_ssmfe_core_free, libspral), Cvoid, (Ptr{Ptr{Cvoid}}, Ptr{spral_ssmfe_inform}), keep, inform)
end
