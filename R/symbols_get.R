#' @title symbols_get
#' @return a data.frame.
#' @export
symbols_get<- function(...){
  mt5<- mt5()
  symbols<- mt5$symbols_get(...) %>% reticulate::py_to_r()

  # realy a loop is needed, converting all to pandas dataframe loses the colnames.
  for ( i in 1:(length(symbols)) ){
    symbols[[i]]<- symbols[[i]][['_asdict']]()
  }

  symbols
}