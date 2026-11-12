# =============================================================================
# MODULE: q1_example1_job_days.R
# EXAMPLE 1: Company job completion time (alpha = 1%)
#
# To run on its own (from the project folder):
#   source("questions/q1_example1_job_days.R")
#   ex1 <- solve_example1()
# =============================================================================

source("R/z_test.R")

# ---- QUESTION ---------------------------------------------------------------
# A company feels that the average number of days required to complete a job
# is 27 days. 50 jobs are picked at random in order to test the assertion.
# The 50 jobs yielded a mean of 25.3 days with a standard deviation of
# 2.1 days. At a level of significance alpha = 1%, test the hypothesis that
# the company's feeling is correct.
# -----------------------------------------------------------------------------

solve_example1 <- function() {

  # ---- GIVEN ----------------------------------------------------------------
  n     <- 50      # number of jobs sampled
  mu0   <- 27      # company's claimed average (days)
  xbar  <- 25.3    # sample mean (days)
  sigma <- 2.1     # standard deviation (days)
  alpha <- 0.01    # level of significance (1%)

  # ---- HYPOTHESES -----------------------------------------------------------
  # H0: mu = 27 days     (company is correct)
  # H1: mu != 27 days    (company is wrong)  -> two-tailed test

  # ---- SOLUTION -------------------------------------------------------------
  cat("EXAMPLE 1: Company job completion time\n")
  large_sample_test(
    n = n, mu0 = mu0, xbar = xbar, sigma = sigma, alpha = alpha,
    h0 = "mu = 27 days", h1 = "mu != 27 days"
  )
}

# ---- EXPECTED (from notes) --------------------------------------------------
# Critical values: 26.234 and 27.77. The sample mean 25.3 lies in the lower
# rejection region -> reject H0. The company was wrong in saying the jobs took
# an average of 27 days.
