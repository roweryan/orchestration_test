## site.pp ##

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
    db_user       => 'user2',
    db_password   => 'secr3t',
    nodes         => {
      Node['int937.example.com'] => Lamp::Mysql['app2'],
      Node['int954.example.com'] => Lamp::Webapp['app2'],
    }
  }

}
