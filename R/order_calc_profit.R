#' @title order_calc_profit
#' @export
order_calc_profit<- function(...){
  mt5<- mt5()
  mt5$order_calc_profit(...) %>% reticulate::py_to_r()
}