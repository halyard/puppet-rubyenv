class rubyenv(
  $versions = ['2.2.2', '2.1.6'],
  $default = '2.2.2',
) {
  include ruby

  ruby::version { $versions: }

  class { 'ruby::global':
    version => $default
  }
}
