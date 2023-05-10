# A puppet manuscript to fix why Apache was returning a 500 error

$file_to_edit = '/var/www/html/wp-settings.php'

#replace "phpp" with "php"

exec { 'replace_line':
  command => "sed -i 's/phpp/php/g' ${file_to_edit}",
  path    => ['/bin','/usr/bin']
}
