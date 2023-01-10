#' @title last_error
#' @export
last_error<- function(...){
  mt5<- mt5()
  mt5$last_error(...) %>% reticulate::py_to_r()
}