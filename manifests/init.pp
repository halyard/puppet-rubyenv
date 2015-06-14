class rubyenv(
  $versions = ['2.2.2', '2.1.6'],
  $default = '2.2.2',
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
  file { "/Users/${::boxen_user}/.rbenv":
    ensure => 'absent',
    force  => true
  }
}
