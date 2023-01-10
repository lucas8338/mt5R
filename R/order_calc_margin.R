#' @title order_calc_margin
#' @export
order_calc_margin<- function(...){
  mt5<- mt5()
  mt5$order_calc_margin() %>% reticulate::py_to_r()
}