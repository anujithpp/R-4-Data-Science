palindrome_check<- function(word){
  string<-tolower(gsub("[^a-zA-z]","",word))
  string_letters<-strsplit(string,NULL)[[1]]
  string_length<-length(string_letters)
  i<-1
  j<-string_length

  while(i<j){
    if(string_letters[i]!=string_letters[j]){
      return(FALSE)
    }
    i<-i+1
    j<-j-1
  }
  return(TRUE)
}
word<-readline(prompt="Enter the string :")
palindrome<-palindrome_check(word)
if(palindrome){
   cat("The given string ",word," is a palindrome")
}else{
   cat("The given string ",word," is not a palindrome")
}
