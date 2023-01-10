#' @title symbols_total
#' @export
symbols_total<- function(...){
  mt5<- mt5()
  mt5$symbols_total(...) %>% reticulate::py_to_r()
}