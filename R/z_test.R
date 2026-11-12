# =============================================================================
# MODULE: z_test.R
# Reusable two-tailed Z-test for a population mean (large sample, n > 30)
#
#   H0: mu = mu0   vs   H1: mu != mu0
#
# Arguments:
#   n, mu0, xbar, sigma, alpha -> data and significance level
#   h0, h1                     -> optional labels printed in the report
#
# Prints a full report and invisibly returns the results as a list.
# =============================================================================

large_sample_test <- function(n, mu0, xbar, sigma, alpha = 0.05,
                              h0 = NULL, h1 = NULL) {

  # Critical Z-value (alpha is split into two tails of alpha/2)
  z_critical <- qnorm(1 - alpha / 2)

  # Standard error of the sample mean
  SE <- sigma / sqrt(n)

  # Critical values on the sample-mean scale:  xbar_c = mu0 +/- z * SE
  lower_critical <- mu0 - z_critical * SE
  upper_critical <- mu0 + z_critical * SE

  # Test statistic and two-tailed p-value
  z       <- (xbar - mu0) / SE
  p_value <- 2 * (1 - pnorm(abs(z)))

  # Decision: reject H0 if xbar falls in either rejection region
  decision <- if (xbar < lower_critical || xbar > upper_critical) {
    "Reject H0"
  } else {
    "Do not reject H0"
  }

  # ---- Report ----
  cat("---------------------------------------------\n")
  if (!is.null(h0)) cat("H0:", h0, "\n")
  if (!is.null(h1)) cat("H1:", h1, "\n\n")
  cat("Sample size (n)           :", n, "\n")
  cat("Hypothesised mean (mu0)   :", mu0, "\n")
  cat("Sample mean (xbar)        :", xbar, "\n")
  cat("Standard deviation (sigma):", sigma, "\n")
  cat("Significance level (alpha):", alpha, "\n\n")

  cat("Critical Z-value          : +/-", round(z_critical, 4), "\n")
  cat("Standard error            :", round(SE, 4), "\n")
  cat("Lower critical xbar       :", round(lower_critical, 4), "\n")
  cat("Upper critical xbar       :", round(upper_critical, 4), "\n")
  cat("Test statistic Z          :", round(z, 4), "\n")
  cat("p-value                   :", round(p_value, 6), "\n\n")

  cat("Decision                  :", decision, "\n")
  if (decision == "Reject H0") {
    cat("Conclusion: There is sufficient evidence that the population mean",
        "is significantly different from", mu0, "\n")
  } else {
    cat("Conclusion: There is insufficient evidence that the population mean",
        "is significantly different from", mu0, "\n")
  }
  cat("---------------------------------------------\n\n")

  invisible(list(
    n = n, mu0 = mu0, xbar = xbar, sigma = sigma, alpha = alpha,
    z_critical = z_critical, SE = SE,
    lower_critical = lower_critical, upper_critical = upper_critical,
    z = z, p_value = p_value, decision = decision
  ))
}
