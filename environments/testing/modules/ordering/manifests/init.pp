class ordering {
  #include ordering::beta
  #include ordering::alpha
  #include ordering::gamma
  #include ordering::myfile
  anchor { 'ordering::start': } ->
    class { 'ordering::beta': } ->
    class { 'ordering::alpha': } ->
    class { 'ordering::gamma': } ->
    class { 'ordering::myfile': } ->
  anchor { 'ordering::end': }
}
