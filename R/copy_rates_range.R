#' @title copy_rates_range
#' @export
copy_rates_range<- function(...){
  if ( vapply(c(...),is.double,TRUE) %>% any() == TRUE ){
    stop("all numeric need to be integers, cant have double.")
  }
  mt5<- mt5()
  pd<- pd()
  mt5$copy_rates_range(...) %>% pd$DataFrame() %>% reticulate::py_to_r()
}