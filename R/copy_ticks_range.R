#' @title copy_ticks_range
#' @export
copy_ticks_range<- function(...){
  if ( vapply(c(...),is.double,TRUE) %>% any() == TRUE ){
    stop("all numeric need to be integers, cant have double.")
  }
  mt5<- mt5()
  pd<- pd()
  mt5$copy_ticks_range(...) %>% pd$DataFrame() %>% reticulate::py_to_r()
}