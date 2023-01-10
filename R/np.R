#' @title np
#' @description import of numpy module of python
#' @export
np<- function(){
  reticulate::import('numpy', convert = FALSE)
}