# Configure Ruby environment for system
class rubyenv(
  $versions = ['2.3.0', '2.2.4', '2.0.0-p648', '1.9.3-p551'],
  $default = '2.3.0',
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
