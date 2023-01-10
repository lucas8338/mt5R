#' @title order_check
#' @export
order_check<- function(...){
  # not tested
  mt5<- mt5()
  bt<- bt()
  mt5$order_check(...)[['_asdict']]() %>% reticulate::py_to_r()
}