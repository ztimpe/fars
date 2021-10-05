#library(fars)
context("Make filename")



test_that("make_filename returns a character vector",{
       string <- make_filename(2013)
          expect_match(string,"accident_2013.csv")})
