#' @title market_book_release
#' @export
market_book_release<- function(...){
  mt5<- mt5()
  mt5$market_book_release(...) %>% reticulate::py_to_r()
}