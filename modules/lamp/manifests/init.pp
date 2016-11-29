application lamp(
  $db_user,
  $db_password,
) {
  lamp::mysql { $name:
    db_user     => $db_user,
    db_password => $db_password,
    export      => Sql[$name],
  }

  lamp::webapp { $name:
    consume => Sql[$name],
  }
}

define lamp::webapp (
  $db_user,
  $db_password,
  $db_host,
  $db_name,
  $docroot = '/var/www/html'
) {
  notify{"creating web app ${name} with db ${db_user}@${db_host}/${db_name}": }
}

define lamp::mysql (
  $db_user,
  $db_password,
  $host     = $::hostname,
  $database = $name,
) {
  notify{"creating mysql db ${database} on ${host} for user ${db_user}": }
}
