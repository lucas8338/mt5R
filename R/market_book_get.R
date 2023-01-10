#' @title market_book_get
#' @export
market_book_get<- function(...){
  mt5<- mt5()
  mt5$market_book_get(...) %>% reticulate::py_to_r()
}