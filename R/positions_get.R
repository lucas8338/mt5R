#' @title positions_get
#' @export
positions_get<- function(...){
  mt5<- mt5()
  pd<- pd()
  positions<- mt5$positions_get(...) %>% reticulate::py_to_r()

  # cause conversiont to pandas dataframe loses the colnames.
  for ( i in 1:(length(positions)) ){
    positions[[i]]<- positions[[i]][['_asdict']]()
  }

  positions
}