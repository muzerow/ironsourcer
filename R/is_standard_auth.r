#' Get Standard API Authentication token
#' @description Get Standard API Authentication token <https://developers.is.com/ironsource-mobile/air/authentication>
#' @importFrom RCurl base64
#'
#' @param username Account login or email
#' @param secret_key Account Secret key
#'
#' @export

is_standard_auth <- function(username, secret_key) {
  token <- base64(paste0(username, ":", secret_key))

  auth_token <- paste("Basic", token)
  return(auth_token)
}
