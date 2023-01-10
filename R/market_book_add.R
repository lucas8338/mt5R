#' @title market_book_add
#' @export
market_book_add<- function(...){
  mt5<- mt5()
  mt5$market_book_add(...) %>% reticulate::py_to_r()
}