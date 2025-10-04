run_length_encoding<-function(string){
  string_letters<-unlist(strsplit(string,NULL))
  str_length<-length(string_letters)

  i<-1
  encoded<-""
  while(i<=str_length){
    count=1
    while(i<str_length && string_letters[i]==string_letters[i+1]){
      count<-count+1
      i<-i+1
    }
    encoded<-paste(encoded,string_letters[i],count,sep = '')
    i<-i+1
  }
  cat("The original string is:",string,"\n")
  cat("The encoded string is:",encoded)
}
string<-readline(prompt = "Enter the string to encode:")
run_length_encoding(string)
