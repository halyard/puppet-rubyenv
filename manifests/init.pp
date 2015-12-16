# Configure Ruby environment for system
class rubyenv(
  $versions = ['2.2.3', '2.2.2', '2.1.6'],
  $default = '2.2.3',
) {
  include ruby

  ruby::version { $versions: }

  class { 'ruby::global':
    version => $default
  }

  ruby_gem { 'bundler for all rubies':
    gem          => 'bundler',
    ruby_version => '*'
  }

  Ruby_gem <| |> ~>
  file { "/Users/${::user}/.rbenv":
    ensure => 'absent',
    force  => true
  }

  file { ['/usr/local/bin/bundler', '/usr/local/bin/bundle']:
    ensure  => absent,
    require => Ruby_gem['bundler for all rubies']
  }
}
