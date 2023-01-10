#' @title account_info
#' @export
account_info<- function(...){
  mt5<- mt5()
  mt5$account_info(...)[['_asdict']]() %>% reticulate::py_to_r()
}