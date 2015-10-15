class ordering::myfile {
  file { '/tmp/foo.txt':
  ensure  => 'file',
  mode    => '0644',
  owner   => '1000',
}
}
