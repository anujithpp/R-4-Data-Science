is_prime<-function(num){
  if(num<=1){
    return(FALSE)
  }
  for(i in 2:sqrt(num)){
    if(num%%i==0){
      return(FALSE)
    }
  }
  return(TRUE)
}
prime_check<-function(){
  num<-as.integer(readline(prompt="Enter a number to check whether its prime or not:"))

  if(is_prime(num)){
    cat(num,"is a prime number \n")
  }
  else{
    cat(num,"is not a prime number \n")
  }
  start<-as.integer(readline(prompt="Enter the start range:"))
  end<-as.integer(readline(prompt="Enter the end range:"))
  cat("Prime number between ",start," and ",end,"are:\n")
  for(i in start:end){
    if(is_prime(i)){
      cat(i," ")
    }
  }
  cat("\n")
}
prime_check()
