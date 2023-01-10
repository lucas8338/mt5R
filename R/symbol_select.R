#' @title symbol_select
#' @export
symbol_select<- function(...){
  mt5<- mt5()
  mt5$symbol_select(...) %>% reticulate::py_to_r()
}