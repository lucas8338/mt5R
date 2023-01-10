#' @title order_send
#' @export
order_send<- function(...){
  # not tested
  mt5<- mt5()
  bt<- bt()
  mt5$order_send(...)[['_asdict']]() %>% reticulate::py_to_r()
}