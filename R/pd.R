#' @title pd
#' @description import of pandas module of python.
#' @export
pd<- function(){
  reticulate::import('pandas', convert = FALSE)
}