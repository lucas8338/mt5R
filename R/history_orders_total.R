#' @title history_orders_total
#' @export
history_orders_total<- function(...){
  mt5<- mt5()
  mt5$history_orders_total(...) %>% reticulate::py_to_r()
}