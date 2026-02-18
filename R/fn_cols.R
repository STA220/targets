#' Define the column names for the dataset.
#' @returns A character vector containing the column names used in the dataset.
#' @examples
#' fn_cols()
fn_cols <- function() {
  c(
    "ID",
    "SurveyYr",
    "Gender",
    "Age",
    "Education",
    "MaritalStatus",
    "HHIncome",
    "HomeOwn",
    "Work",
    "Diabetes",
    "BMI",
    "TotChol",
    "BPSysAve",
    "BPDiaAve"
  )
}
