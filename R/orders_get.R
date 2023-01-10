#' @title orders_get
#' @export
orders_get<- function(...){
  mt5<- mt5()
  orders<- mt5$orders_get() %>% reticulate::py_to_r()

  # converting to pandas dataframe loses the colnames.
  for ( i in 1:(length(orders)) ){
    orders[[i]]<- orders[[i]][['_asdict']]()
  }

  orders
}