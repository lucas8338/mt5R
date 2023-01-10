#' @title positions_total
#' @export
positions_total<- function(...){
  mt5<- mt5()
  mt5$positions_total(...) %>% reticulate::py_to_r()
}