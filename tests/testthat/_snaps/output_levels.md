# one argument prints successfully

    Code
      output_levels(c("foo", "bar", "baz"))
    Output
      "foo",
      "bar",
      "baz"

# multiple arguments print successfully

    Code
      output_levels("foo", "bar", "baz")
    Output
      "foo",
      "bar",
      "baz"

# arguments of different lengths print successfully

    Code
      output_levels("foo", c("bar", "baz"), "barf")
    Output
      "foo",
      "c("bar", "baz")",
      "barf"

