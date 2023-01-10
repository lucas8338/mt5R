#' @title symbol_info
#' @export
symbol_info<- function(...){
  mt5<- mt5()
  mt5$symbol_info(...)[['_asdict']]() %>% reticulate::py_to_r()
}