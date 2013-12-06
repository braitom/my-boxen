# Class: people::braitom
#
#
class people::braitom {
  include chrome
  include iterm2::stable
  include dropbox
  include vagrant
  include alfred
  include virtualbox
  include evernote
  include cyberduck
  include mou
  include sublime_text_2
  include sizeup
  include firefox
  
  # OSX Settings
  include osx::dock::autohide
  include osx::show_external_hard_drives_on_desktop
  include osx::show_removale_media_on_desktop
  include osx::show_hidden_files
  class { 'osx::dock::position':
    position => "left"
  }

  # homebrew install
  package {
    [
      'wget',
      'tree',
      'jq',
      'readline'
    ]:
  }
  
  # package install
  package {
    'GoogleJapaneseInput':
      source => "http://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg",
      provider => pkgdmg;
    'kobito':
      source => "http://kobito.qiita.com/download/kobito_v1.8.4.zip"
      provider => compressed_app;
    'XtraFinder':
      source => "http'//www.trankyunam.com/xtrafinder/downloads/XtraFinder.dmg"
      provider => pkgdmg"
  }

  $home    = "/User/${::boxen_user}"

  include python::2_7_5
  class { 'python::global': version => '2.7.5' }
}
