#' @title history_orders_get
#' @export
history_orders_get<- function(...){
  mt5<- mt5()
  pd<- pd()
  orders<- mt5$history_orders_get(...) %>% reticulate::py_to_r()

  # cause conversiont to pandas dataframe loses the colnames.
  for ( i in 1:(length(orders)) ){
    orders[[i]]<- orders[[i]][['_asdict']]()
  }

  orders
}