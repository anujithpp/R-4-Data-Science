series<-function(){
  n<-as.integer(readline(prompt="Enter the number of terms:"))
  sum<-0
  term_series<-c('',n)

  for(i in 2:n){
    numerator<-i
    denominator<-2*i-1

    term<-numerator/denominator
    if(i%%2==0){
      term<- -term
    }
    sum<-sum+term

    if(i%%2==0){
      term_series[i]<-sprintf("- %d/%d",numerator,denominator)
    }
    else{
      term_series[i]<-sprintf("+ %d/%d",numerator,denominator)
    }
  }
  series_string<-paste0(term_series,collapse = "")
  cat("The series is :1",series_string,"\n")
  cat("The sum of series is :",sum+1,"\n")
}
series()
