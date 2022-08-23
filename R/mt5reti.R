# mt5reti
#
# @description this package is a implementation in R for mt5/mql5 python's MetaTrader5 through reticulate for more
# information and documentation read: "https://www.mql5.com/pt/docs/integration/python_metatrader5"
library(reticulate)
library(glue)
library(dplyr)


mt5<- function(){
  reticulate::import('MetaTrader5',convert = FALSE)
}

pd<- function (){
  reticulate::import('pandas',convert = FALSE)
}
#' @title initialize
#' @param path path
#' @param ... elipsis
#' @return -
#' @export
initialize<- function(path='',...){
  dots<- list(...)
  if ('login' %in% names(dots)){
    dots$login<- as.integer(dots$login)
  }
  do.call(mt5()$initialize,c(path,dots))%>%py_to_r()
}
#' @title login
#' @param ... elipsis
#' @return -
#' @export
login<- function(...){
  dots<- list(...)
  if ('login' %in% names(dots)){
    dots$login<- as.integer(dots$login)
  }
  do.call(mt5()$login,c(dots))%>%py_to_r()
}
#' @title shutdown
#' @param ... elipsis
#' @return -
#' @export
shutdown<- function(...){
  mt5()$shutdown()%>%py_to_r()
}
#' @title version
#' @return -
#' @export
version<- function(){
  mt5()$version()%>%py_to_r()
}
#' @title last_error
#' @return -
#' @export
last_error<- function(){
  mt5()$last_error()%>%py_to_r()
}
#' @title account_info
#' @return -
#' @export
account_info<- function(){
  data<- mt5()$account_info()
  pd()$DataFrame(data)%>%py_to_r()
}
#' @title terminal_info
#' @return -
#' @export
terminal_info<- function(){
  data<- mt5()$terminal_info()
  pd()$DataFrame(data)%>%py_to_r()
}
#' @title symbols_total
#' @return -
#' @export
symbols_total<- function(){
  mt5()$symbols_total()%>%py_to_r()
}
#' @title symbols_get
#' @param ... elipsis
#' @return -
#' @export
symbols_get<- function(...){
  data<- mt5()$symbols_get(...)
  pd()$DataFrame(data)%>%py_to_r()
}
#' @title symbol_info
#' @param symbol character
#' @return -
#' @export
symbol_info<- function(symbol){
  data<- mt5()$symbol_info(symbol)
  pd()$DataFrame(data)%>%py_to_r()
}
#' @title symbol_select
#' @param symbol character
#' @param enable bool
#' @return -
#' @export
symbol_select<- function(symbol,enable){
  mt5()$symbol_select(symbol,enable)%>%py_to_r()
}
#' @title market_book_add
#' @param symbol character
#' @return -
#' @export
market_book_add<- function(symbol){
  mt5()$market_book_add(symbol)%>%py_to_r()
}
#' @title market_book_get
#' @param symbol character
#' @return -
#' @export
market_book_get<- function(symbol){
  mt5()$market_book_get(symbol)%>%py_to_r()
}
#' @title market_book_release
#' @param symbol character
#' @return -
#' @export
market_book_release<- function(symbol){
  mt5()$market_book_release(symbol)%>%py_to_r()
}
#' @title copy_rates_from
#' @param ... elipsis
#' @return -
#' @export
copy_rates_from<- function(...){
  dots<- list(...)
  for (i in 1:(length(dots))){
    if (is.numeric(dots[[i]])){
      print(dots[[i]])
      dots[[i]]<- dots[[i]]%>%as.integer()
    }
  }

  dots[[2]]<- mt5()[[dots[[2]]]]

  data<- do.call(mt5()$copy_rates_from,dots)
  pd()$DataFrame(data)%>%reticulate::py_to_r()
}
#' @title copy_rates_range
#' @param symbol character
#' @param timeframe mt5 timeframe
#' @param date_from int
#' @param date_to int
#' @return -
#' @export
copy_rates_range<- function(symbol,timeframe,date_from,date_to){
  date_from<- as.integer(date_from)
  date_to<- as.integer(date_to)
  data<- mt5()$copy_rates_range(symbol,mt5()[[timeframe]],date_from,date_to)
  res<- pd()$DataFrame(data)
  res%>%reticulate::py_to_r()
}

