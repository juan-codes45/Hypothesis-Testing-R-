# =============================================================================
# MODULE: q2_example2i_tyres_1pct.R
# EXAMPLE 2 (i): Tyre diameter (alpha = 1%)
#
# To run on its own (from the project folder):
#   source("questions/q2_example2i_tyres_1pct.R")
#   ex2i <- solve_example2i()
# =============================================================================

source("R/z_test.R")

# ---- QUESTION ---------------------------------------------------------------
# A manager had determined that their car tires must have an average of
# 91.44 cm in diameter in order to fit the mast. A random sample of 100 tires
# yielded a mean of 92.4 cm with a standard deviation of 5.4 cm. At a level of
# significance (i) alpha = 1%  (ii) alpha = 0.05, determine whether the
# manager had anything to worry about.
#
# This module solves PART (i): alpha = 1%
# -----------------------------------------------------------------------------

solve_example2i <- function() {

  # ---- GIVEN ----------------------------------------------------------------
  n     <- 100     # number of tyres sampled
  mu0   <- 91.44   # required average diameter (cm)
  xbar  <- 92.4    # sample mean (cm)
  sigma <- 5.4     # standard deviation (cm)
  alpha <- 0.01    # level of significance (1%)

  # ---- HYPOTHESES -----------------------------------------------------------
  # H0: mu = 91.44 cm    (manager has nothing to worry about)
  # H1: mu != 91.44 cm   (manager has something to worry about) -> two-tailed

  # ---- SOLUTION -------------------------------------------------------------
  cat("EXAMPLE 2 (i): Tyre diameter, alpha = 1%\n")
  large_sample_test(
    n = n, mu0 = mu0, xbar = xbar, sigma = sigma, alpha = alpha,
    h0 = "mu = 91.44 cm (nothing to worry about)",
    h1 = "mu != 91.44 cm (something to worry about)"
  )
}

# ---- EXPECTED (from notes) --------------------------------------------------
# Critical values: 90.05 cm and 92.83 cm. The sample mean 92.4 lies inside
# -> accept H0. There is no significant difference; the manager has nothing
# to worry about.
