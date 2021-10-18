context('Test that DARr functions work correctly')

test_that("Multiply two numbers in my_function", {
  expect_equal(my_function(4,5), 20)
})

test_that("Check example_data is a data frame and CompanyName is a character type", {
  expect_type(example_data$CompanyName, "character")
})
