#' Get User Level Revenue Data from Ad Revenue Measurement API
#' @description Get User Level Revenue Data from Ad Revenue Measurement API <https://developers.is.com/ironsource-mobile/air/ad-revenue-measurements>
#' @importFrom httr add_headers content GET
#'
#' @param date Date of report in UTC timezone
#' @param app_key Application key
#' @param bearer_token Bearer API Authentication token
#' @param report_type Report type, default is 1
#'
#' @export

is_revenue_user <- function(date, app_key, bearer_token, report_type = 1) {
  download_link <- GET("https://platform.ironsrc.com/partners/userAdRevenue/v3?",
                       query = list(date = date,
                                    appKey = app_key,
                                    reportType = report_type),
                       add_headers("Authorization" = bearer_token))

  if (download_link$status_code != 200) {
    stop(paste0("Error code ", download_link$status_code, ": ", content(download_link)$error))
  }

  download_link <- content(download_link)$urls[[1]]
  return(download_link)
}
