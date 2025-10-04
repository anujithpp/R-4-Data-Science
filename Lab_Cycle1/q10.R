data_reversal<-function(data){
  if(length(data)<=1){
    return(data)
  }
  return(c(data_reversal(data[-1]),data[1]))
}
data<-readline(prompt="Enter the data in list space separated:")
data<-unlist(strsplit(data," "))
reversed<-data_reversal(data)
cat("The reversed list  is:",paste(reversed,collapse = " "))
