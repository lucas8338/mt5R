#' @title history_deals_total
#' @export
history_deals_total<- function(...){
  mt5<- mt5()
  mt5$history_deals_total(...) %>% reticulate::py_to_r()
}