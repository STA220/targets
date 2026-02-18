library(targets)
library(tarchetypes)
tar_source()

tar_option_set(
  format = "qs",
  packages = c("dplyr", "janitor")
)

list(
  tar_target(local_file, "data/NHANES.csv", format = "file"),
  tar_target(tbl_NHANES, readr::read_csv(local_file)),

  # * Subset ----
  tar_target(tbl_NHANES_subset, select(tbl_NHANES, one_of(fn_cols()))),

  # * Cleanup ----
  tar_target(tbl_clean, fn_clean(tbl_NHANES_subset)),

  # * Model ----
  tar_target(mod_lm, slow_lm_mod(tbl_clean)),
  tar_target(mod_lm_coeffs, broom::tidy(mod_lm)),

  # * Export ----
  tar_target(
    export_mod_lm_coeffs,
    {
      output_file <- "output/mod_lm_coeffs.csv"
      readr::write_csv(mod_lm_coeffs, output_file)
      output_file
    },
    format = "file"
  ),

  # * Report ----
  tar_render(report, "report.qmd", params = list(tbl_coeff = mod_lm_coeffs))
)
