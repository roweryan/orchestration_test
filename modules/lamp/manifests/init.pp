application lamp(
  $db_user,
  $db_pass,
  $db_host,
  $db_name,
) {

  lamp::mysql { $name:
    db_user => $db_user,
    db_pass => $db_pass,
    db_host => $db_host,
    db_name => $db_name,
    export  => Sql[$name],
  }

  lamp::webapp { $name:
    consume => Sql[$name],
  }
}

Lamp::Mysql produces Sql {
  user     => $db_user,
  password => $db_pass,
  host     => $db_host,
  database => $db_name,
}

Lamp::Webapp consumes Sql {
  db_user => $user,
  db_pass => $password,
  db_host => $host,
  db_name => $database,
}

define lamp::mysql (
  $db_user,
  $db_pass,
  $db_host,
  $db_name,
) {
  file { '/tmp/mysql.ini':
    content => "name ${name} db_user ${db_user} db_pass ${db_pass} db_host ${db_host} db_name ${db_name}",
  }
}

define lamp::webapp (
  $db_user,
  $db_pass,
  $db_host,
  $db_name,
) {
  file { '/tmp/webapp.ini':
    content => "name ${name} db_user ${db_user} db_pass ${db_pass} db_host ${db_host} db_name ${db_name}",
  }
}
