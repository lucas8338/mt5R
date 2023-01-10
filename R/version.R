#' @title version
#' @export
version<- function(...){
  mt5<- mt5()
  mt5$version(...) %>% reticulate::py_to_r()
}