tidy { "/tmp":
  age     => "1w",
  recurse => 1,
  matches => [ "*.error" ]
}
