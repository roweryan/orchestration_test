node default {
  ini_setting { 'use_cached_catalog':
    ensure  => present,
    path    => $settings::config,
    section => 'agent',
    setting => 'use_cached_catalog',
    value   => 'true',
  }
}

site {

  lamp{'app2':
    db_user => '3db_user',
    db_pass => '3db_pass',
    db_name => '3db_name',
    db_host => '3db_host',
    nodes   => {
      Node['n37.example.com'] => Lamp::Mysql['app2'],
      Node['n54.example.com'] => Lamp::Webapp['app2'],
    }
  }

}
