#' Gets authorization token for IronSource API
#' @importFrom httr add_headers content GET
#' @export

is_auth <- function(secret_key, refresh_token) {
  token <- content(GET("https://platform.ironsrc.com/partners/publisher/auth",
                       add_headers('secretkey' = secret_key,
                                   'refreshToken' = refresh_token)))

  auth_token <- paste("Bearer", token)
  return(auth_token)
}
