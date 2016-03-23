#package nginx
class nginx{
    package {'nginx':,
    ensure => present,
  }
  
  # document root/var/www
  file{'/var/www':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0755',
  }
  
  #index.html
  file{'/var/www/index.html':
    ensure => file,
    owner => 'root',
    group => 'root'
    mode => '0755',
    source => 'puppet:///modules/nginx/index.html',
  }
  
  #config file nginx.conf
  file{'/etc/nginx/nginx.conf':
    ensure => file,
    owner => 'root',
    group => 'root'
    mode => '0755'
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  }
  
  file{'/etc/nginx/conf.d':
    ensure => file,
    owner => 'root',
    group => 'root'
    mode => '0755',
  }
  
  file{'/etc/nginx/nginx.conf/default.conf':
    ensure => file,
    owner => 'root',
    group => 'root'
    mode => '0755',
    source => 'puppet:///modules/nginx/nginx.conf',
    require => Package['nginx'],
    notify => Service['nginx'],
  }  
  
  service{'nginx':
    ensure => running,
    enable => true,
  }
}
