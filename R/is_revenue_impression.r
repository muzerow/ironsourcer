#' Get Impression Level Revenue Data from Ad Revenue Measurement API
#' @description Get Impression Level Revenue Data from Ad Revenue Measurement API <https://developers.is.com/ironsource-mobile/air/ad-revenue-measurements>
#' @importFrom httr add_headers content GET
#' @importFrom stringr str_glue
#'
#' @param date Date of report in UTC timezone
#' @param app_key Application key
#' @param bearer_token Bearer API Authentication token
#'
#' @export

is_revenue_impression <- function(date, app_key, bearer_token) {
  url <- str_glue("https://platform.ironsrc.com/partners/adRevenueMeasurements/v1?date={date}&appKey={app_key}")
  download_link <- GET(url, add_headers("Authorization" = bearer_token))

  if (download_link$status_code != 200) {
    stop(paste0("Error code ", download_link$status_code, ": ", content(download_link)$error))
  }

  download_link <- content(download_link)$urls[[1]]
  return(download_link)
}
