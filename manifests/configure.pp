class git::configure($scm_user=false, $scm_email=false) {

  validate_string($scm_user)
  validate_string($scm_email)
  validate_string($git::user)

  $home = "/home/${git::user}"

  define git_config($value) {
    exec {"set git ${name} ${value}":
      command     => "git config --global $name $value",
      path        => ["/usr/bin", "/usr/sbin"],
      user        => "root",
      environment => "HOME=${git::configure::home}",
      require     => Package['git-core'],
      unless      => "git config --get $name"
    }
  }

  git_config{'user.name': value => $scm_user}
  git_config{ 'user.email': value => $scm_email}
  git_config{ 'core.editor': value => 'vim'}
  git_config{ 'init.templatedir': value => '~/.git_template' }
  git_config {'alias.sub-add': value => "'submodule add'"}
  git_config {'alias.sub-up': value => "'submodule update --init'"}
  git_config {'alias.cm': value => "'commit -m'"}
  git_config {'alias.for-pull': value => "'submodule foreach git pull'"}
  git_config {'http.sslVerify': value => 'false'}

  git::clone {'git_template':
    url   => 'git://github.com/narkisr/git_template.git',
    dst   => "${home}/.git_template",
    owner => $git::user
  }
}
