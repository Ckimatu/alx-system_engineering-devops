# using Puppet to make changes to our configuration file
# SSH client configuration must be configured
# to use the private key ~/.ssh/school
# It must also be configured to
# refuse to authenticate using a password

file_line {'Password_auth':
  ensure => present,
  path   => '/etc/ssh/sshd_config',
  line   => '    PasswordAuthentication no',
}

file_line { 'Config_file':
  ensure => present,
  path   => '/etc/ssh/sshd_config',
  line   => '    IdentityFile ~/.ssh/school',
}
