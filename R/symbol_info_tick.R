#' @title symbol_info_tick
#' @export
symbol_info_tick<- function(...){
  mt5<- mt5()
  mt5$symbol_info_tick(...) %>% reticulate::py_to_r()
}