#' Get Bearer API Authentication token
#' @description Get Bearer API Authentication token <https://developers.is.com/ironsource-mobile/air/authentication>
#' @importFrom httr add_headers content GET
#'
#' @param secret_key Account Secret key
#' @param refresh_token Account Refresh token
#'
#' @export

is_bearer_auth <- function(secret_key, refresh_token) {
  token <- content(GET("https://platform.ironsrc.com/partners/publisher/auth",
                       add_headers('secretkey' = secret_key,
                                   'refreshToken' = refresh_token)))

  auth_token <- paste("Bearer", token)
  return(auth_token)
}
