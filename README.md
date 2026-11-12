# Testing of Hypothesis in R: Large Sample (Z) Test

R code for a two-tailed Z-test for a population mean, with each question from the course notes solved in its own module.

- **H0:** mu = mu0
- **H1:** mu != mu0

## Project structure

```
Hypothesis Testing R/
├── main.R                              # runs all questions and prints a summary
├── R/
│   └── z_test.R                        # shared function: large_sample_test()
├── questions/
│   ├── q1_example1_job_days.R          # Example 1  (alpha = 1%)
│   ├── q2_example2i_tyres_1pct.R       # Example 2 (i)  (alpha = 1%)
│   └── q3_example2ii_tyres_5pct.R      # Example 2 (ii) (alpha = 0.05)
├── README.md
└── .gitignore
```

Each question module contains the question text as comments, followed by the given data, the hypotheses, the solution code, and the answer expected from the notes.

## How to run

Set the working directory to the project folder, then:

```r
source("main.R")                         # run everything
```

Or run a single question:

```r
source("questions/q1_example1_job_days.R")
ex1 <- solve_example1()
```

## Results

| Question | alpha | Z critical | Z observed | p-value | Decision |
|---|---|---|---|---|---|
| Example 1 | 0.01 | 2.5758 | -5.7241 | < 0.0001 | Reject H0 |
| Example 2 (i) | 0.01 | 2.5758 | 1.7778 | 0.0755 | Do not reject H0 |
| Example 2 (ii) | 0.05 | 1.9600 | 1.7778 | 0.0755 | Do not reject H0 |

## Adding a new question

1. Copy one of the files in `questions/` and rename it.
2. Replace the question text, the given data, and the hypotheses.
3. Rename the `solve_...()` function and call it from `main.R`.

## Requirements

R (4.0 or later). No extra packages are needed.
