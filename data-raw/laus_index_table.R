## code to prepare `laus_index_table` dataset goes here

laus_index_table <- bls_index_table(LAUS_PATH)

usethis::use_data(laus_index_table, overwrite = TRUE)
