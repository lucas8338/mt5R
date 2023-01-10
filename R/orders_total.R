#' @title orders_total
#' @export
orders_total<- function(...){
  mt5<- mt5()
  mt5$orders_total(...) %>% reticulate::py_to_r()
}