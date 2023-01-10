#' @title mt5
#' @description the import of the mt5 from python to reticulate to be used internaly by the package.
#' @return a reticulate environment.
#' @export
mt5<- function(){
  reticulate::import('MetaTrader5', convert = FALSE)
}