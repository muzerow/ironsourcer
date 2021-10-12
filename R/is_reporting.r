#' Get Data from Reporting API
#' @description Get Data from Reporting API <https://developers.is.com/ironsource-mobile/air/reporting/>
#' @importFrom httr add_headers content GET
#'
#' @param start_date Start date of report in UTC timezone
#' @param end_date End date of report in UTC timezone
#' @param bearer_token Bearer API Authentication token
#' @param app_key Application key filter
#' @param country Country filter
#' @param ad_units Ad units filter
#' @param ad_source Ad source filter
#' @param metrics Metrics filter
#' @param breakdowns Breakdowns for the report
#'
#' @export

is_reporting <- function(start_date, end_date, bearer_token,
                         app_key = NULL, country = NULL, ad_units = NULL, ad_source = NULL, metrics = NULL, breakdowns = NULL) {
  report <- GET("https://platform.ironsrc.com/partners/publisher/mediation/applications/v6/stats?",
                query = list(startDate = start_date,
                             endDate = end_date,
                             appKey = app_key,
                             country = country,
                             adUnits = ad_units,
                             adSource = ad_source,
                             metrics = paste0(metrics, collapse = ","),
                             breakdowns = paste0(breakdowns, collapse = ",")),
                add_headers("Authorization" = bearer_token))

  if (report$status_code != 200) {
    stop(paste0("Error code ", report$status_code, ": ", content(report)$error))
  }

  report <- content(report)
  return(report)
}
