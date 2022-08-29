#' Load IronSource Data from Link
#' @description Load IronSource Data from Link
#' @importFrom R.utils gunzip
#'
#' @param link Link gathered from IronSource API
#' @param file_path Destination path including the file name
#'
#' @export

is_revenue_user <- function(link, file_path) {
  download.file(link, file_path, mode = "wb")
  gunzip(file_path)
}
