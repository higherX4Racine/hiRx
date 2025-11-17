# Install a keypair in Your `.Renviron` File for Repeated Use

This function will add the keypair to your `.Renviron` file so it can be
called securely without being stored in your code. After installation,
it can be called any time by typing `Sys.getenv("KEY")` and can be used
in package functions by simply typing KEY. If you do not have an
`.Renviron` file, the function will create on for you. If you already
have an `.Renviron` file, the function will append the key to your
existing file, while making a backup of your original file for disaster
recovery purposes.

## Usage

``` r
set_environment_variable(key, value, overwrite = FALSE, install = FALSE)
```

## Arguments

- key:

  The name of the environment variable. TODO: constrain all caps.

- value:

  The value of the environment variable.

- overwrite:

  If this is set to TRUE, it will overwrite an existing KEY that you
  already have in your `.Renviron` file.

- install:

  if TRUE, will install the key in your `.Renviron` file for use in
  future sessions. Defaults to FALSE.

## Examples

``` r
if (FALSE) { # \dontrun{
set_environment_variable("SECRET_KEY" = "111111abc", install = TRUE)
# First time, reload your environment so you can use the key without restarting R.
readRenviron("~/.Renviron")
# You can check it with:
Sys.getenv("SECRET_KEY")
} # }

if (FALSE) { # \dontrun{
# If you need to overwrite an existing key:
set_environment_variable("SECRET_KEY", "111111abc", overwrite = TRUE, install = TRUE)
# First time, relead your environment so you can use the key without restarting R.
readRenviron("~/.Renviron")
# You can check it with:
Sys.getenv("SECRET_KEY")
} # }
```
