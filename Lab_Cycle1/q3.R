students <- data.frame(Name = character(), Age = numeric(), Grade = character(), stringsAsFactors = FALSE)
n <- as.numeric(readline(prompt ="Enter the number of students"))
for (i in 1:n){
    name <- readline(prompt = "Enter your name: ")
    age <- as.numeric(readline(prompt = "Enter your age: "))
    while (is.na(age) || age <= 0) {
      cat("Please enter a valid age\n")
      flush.console()
      age <- as.numeric(readline(prompt = "Enter your age: "))
    }

    grade <- readline(prompt = "Enter your grade: ")
    grades <- c('A', 'B', 'C', 'D', 'F')
    while (!(grade %in% grades)) {
      cat("Please enter a valid grade [A,B,C,D,F] \n")
      flush.console()
      grade <- readline(prompt = "Enter your grade: ")
    }

    students <- rbind(students, data.frame(Name = name, Age = age, Grade = grade))

}
cat("VALID STUDENTS RECORDS\n")
print(students)
cat("\n MEAN AGE OF STUDENTS", mean(students$Age), "\n")
