#' Fit a linear model to predict diastolic blood pressure based on systolic blood pressure
#' @param tbl A data frame containing the variables `bp_dia_ave`, `bp_sys_ave`, `gender`, and `age`. The function will filter out rows where `bp_dia_ave` or `bp_sys_ave` are not greater than 0 before fitting the model.
#' @returns A linear model object resulting from fitting the specified linear regression model.
slow_lm_mod <- function(tbl) {
  tbl2 <- filter(tbl, bp_dia_ave > 0, bp_sys_ave > 0)

  message("This is very time consuming ...")
  for (i in 1:20) {
    Sys.sleep(1)
    cat(".", append = TRUE)
    if (i == 10) {
      message("Go get a coffe!")
    }
    if (i == 15) message("Come back next week!")
  }

  lm(bp_dia_ave ~ bp_sys_ave + gender + age, tbl2)
}
