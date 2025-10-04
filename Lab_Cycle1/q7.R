fibonacci_series<-function(){
  num<-as.integer(readline(prompt="Enter the number of terms:"))
  if(num<=0){
    cat("Enter a positive integer \n")
    num<-as.integer(readline(prompt="Enter the number of terms:"))
  }
  if(num>=1){
    series<-c(0)
  }
  if(num>=2){
    series<-c(series,1)
  }
  if(num>=3){
    series<-c(series,2)
  }
  for(i in 4:num){
    term<-series[i-1]+series[i-2]+series[i-3]
    series<-c(series,term)
  }
  cat("The series is :\n",paste(series,collapse = " ,"))
}
fibonacci_series()
