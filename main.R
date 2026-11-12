# =============================================================================
# MAIN SCRIPT: runs every question module and prints a summary
#
# Set the working directory to the project folder first, e.g.
#   setwd("path/to/hypothesis-testing-r")
# (In RStudio: open the project folder, or Session > Set Working Directory)
# =============================================================================

# ---- Load modules -----------------------------------------------------------
source("R/z_test.R")                              # shared Z-test function
source("questions/q1_example1_job_days.R")        # Example 1
source("questions/q2_example2i_tyres_1pct.R")     # Example 2 (i)
source("questions/q3_example2ii_tyres_5pct.R")    # Example 2 (ii)

# ---- Run each question ------------------------------------------------------
ex1   <- solve_example1()
ex2i  <- solve_example2i()
ex2ii <- solve_example2ii()

# ---- Summary of all results -------------------------------------------------
results <- list(
  "Example 1"      = ex1,
  "Example 2 (i)"  = ex2i,
  "Example 2 (ii)" = ex2ii
)

summary_table <- data.frame(
  Question   = names(results),
  alpha      = sapply(results, function(r) r$alpha),
  Z_critical = round(sapply(results, function(r) r$z_critical), 4),
  Z_observed = round(sapply(results, function(r) r$z), 4),
  p_value    = round(sapply(results, function(r) r$p_value), 6),
  Decision   = sapply(results, function(r) r$decision),
  row.names  = NULL
)

cat("SUMMARY OF RESULTS\n")
print(summary_table)
