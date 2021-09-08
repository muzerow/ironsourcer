#' Get Bearer API Authentication token
#' @description Get Bearer API Authentication token <https://developers.is.com/ironsource-mobile/air/authentication>
#' @importFrom httr add_headers content GET
#'
#' @param secret_key Account Secret key
#' @param refresh_token Account Refresh token
#'
#' @export

is_bearer_auth <- function(secret_key, refresh_token) {
  token <- GET("https://platform.ironsrc.com/partners/publisher/auth",
               add_headers("secretkey" = secret_key,
                           "refreshToken" = refresh_token))

  if (token$status_code != 200) {
    stop(paste0("Error code ", token$status_code, ": ", content(token)$error))
  }

  auth_token <- paste("Bearer", content(token))
  return(auth_token)
}
