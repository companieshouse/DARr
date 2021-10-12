#' Example Function to multiply two numbers 
#'
#' This is a simple function that, by default, multiplies two numbers. 
#' @param x one of the arguments to multiply.
#' @param y one of the arguments to multiply.
#'
#' @export
my_function <- function(x, y) {
  print("First Function here...")
  x*y
}


#' Demonstrate how the overdue function works using dummy data 
#'
#' This is an example function to demonstrate how the main function works. 
#'
#' @export
example <- function() {
  example_data <- NULL
  load("./data/example_data.rda")
  overdue(example_data)
}


#' Main Function
#'
#' This is calculates the percentage of overdue accounts. 
#' @param ch_data the dataset to work on.
#' @param mode the type of account to include - default is all.
#'
#' @export
overdue <- function(ch_data, mode = '') {
  print("YAY")
  
  # Summary of ch_data
  summary(ch_data)
  
  # Get a dataframe with only 3 columns (discard the rest)
  all_companies <- ch_data[c("CompanyName", "CompanyStatus", "Accounts.NextDueDate")]
  
  # Get all active companies (discard the rest)
  active <- all_companies[all_companies$CompanyStatus == "Active", ]
  active
  
  # Convert date column to R date
  active$Accounts.Due = as.Date(active$Accounts.NextDueDate, "%d/%m/%Y")
  summary(active)
  
  # Get current date
  current <- Sys.Date()
  class(current)
  
  # Append column with overdue dates and select only these rows
  active$due <- active$Accounts.Due - current
  overdue <- active[active$due <0, ]
  # na.omit gets rid of any row with N/A
  overdue <- na.omit(overdue)
  overdue
  
  # Calculate percentage of overdue accounts ... pod
  all_companies_number <- nrow(all_companies)
  all_companies_active <- nrow(active)
  overdue_number <- nrow(overdue)
  overdue_number
  all_companies_active
  
  pod <- (overdue_number / all_companies_active) * 100
  
}
