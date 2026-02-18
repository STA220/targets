#' Tidy up the data frame by cleaning column names and dropping rows with NA values.
#' @param tbl A data frame to be cleaned.
#' @returns A cleaned data frame with standardized column names and no NA values.
#' @examples
#' df <- data.frame("ID" = c(1, 2, NA), "SurveyYr" = c(2020, 2021, 2022), "Gender" = c("M", "F", "M"))
#' fn_clean(df)
fn_clean <- function(tbl) {
  tbl |>
    janitor::clean_names() |>
    tidyr::drop_na()
}
