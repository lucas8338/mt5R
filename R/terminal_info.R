#' @title terminal_info
#' @export
terminal_info<- function(...){
  mt5<- mt5()
  mt5$terminal_info(...)[['_asdict']]() %>% reticulate::py_to_r()
}