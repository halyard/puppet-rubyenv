class rubyenv {
  include ruby

  ruby::version { '1.8.7':
    require     => Package['homebrew/dupes/apple-gcc42']
  }
  ruby::version { '1.9.3': }
  ruby::version { '2.0.0': }
  ruby::version { '2.1.0': }
  ruby::version { '2.1.1': }
  ruby::version { '2.1.2': }
  class { 'ruby::global':
    version => '2.1.2'
  }
}
