#' @title shutdown
#' @export
shutdown<- function(...){
  mt5<- mt5()
  mt5$shutdown(...) %>% reticulate::py_to_r()
}