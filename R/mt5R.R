library(reticulate)
library(glue)
library(dplyr)

mt5<- reticulate::import('MetaTrader5',convert = FALSE)
pd<- reticulate::import('pandas',convert = FALSE)

initialize<- function(path='',...){
  dots<- list(...)
  if ('login' %in% names(dots)){
    dots$login<- as.integer(dots$login)
  }
  do.call(mt5$initialize,c(path,dots))%>%py_to_r()
}

login<- function(...){
  dots<- list(...)
  if ('login' %in% names(dots)){
    dots$login<- as.integer(dots$login)
  }
  do.call(mt5$login,c(dots))%>%py_to_r()
}

shutdown<- function(...){
  mt5$shutdown()%>%py_to_r()
}

version<- function(){
  mt5$version()%>%py_to_r()
}

last_error<- function(){
  mt5$last_error()%>%py_to_r()
}

account_info<- function(){
  data<- mt5$account_info()
  pd$DataFrame(data)%>%py_to_r()
}

terminal_info<- function(){
  data<- mt5$terminal_info()
  pd$DataFrame(data)%>%py_to_r()
}

symbols_total<- function(){
  mt5$symbols_total()%>%py_to_r()
}

symbols_get<- function(...){
  data<- mt5$symbols_get(...)
  pd$DataFrame(data)%>%py_to_r()
}

symbol_info<- function(symbol){
  data<- mt5$symbol_info(symbol)
  pd$DataFrame(data)%>%py_to_r()
}

symbol_select<- function(symbol,enable){
  mt5$symbol_select(symbol,enable)%>%py_to_r()
}

market_book_add<- function(symbol){
  mt5$market_book_add(symbol)%>%py_to_r()
}

market_book_get<- function(symbol){
  mt5$market_book_get(symbol)%>%py_to_r()
}

market_book_release<- function(symbol){
  mt5$market_book_release(symbol)%>%py_to_r()
}

copy_rates_from<- function(...){
  dots<- list(...)
  for (i in 1:(length(dots))){
    if (is.numeric(dots[[i]])){
      print(dots[[i]])
      dots[[i]]<- dots[[i]]%>%as.integer()
    }
  }

  dots[[2]]<- mt5[[dots[[2]]]]

  data<- do.call(mt5$copy_rates_from,dots)
  pd$DataFrame(data)%>%reticulate::py_to_r()
}

copy_rates_range<- function(symbol,timeframe,date_from,date_to){
  date_from<- as.integer(date_from)
  date_to<- as.integer(date_to)
  data<- mt5$copy_rates_range(symbol,mt5[[timeframe]],date_from,date_to)
  res<- pd$DataFrame(data)
  res%>%reticulate::py_to_r()
}

