#' @title history_deals_get
#' @export
history_deals_get<- function(...){
  mt5<- mt5()
  pd<- pd()
  deals<- mt5$history_deals_get(...) %>% reticulate::py_to_r()

  # cause conversiont to pandas dataframe loses the colnames.
  for ( i in 1:(length(deals)) ){
    deals[[i]]<- deals[[i]][['_asdict']]()
  }

  deals
}