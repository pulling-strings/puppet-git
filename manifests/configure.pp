# Configuring local git, user is the OS user
# Scm user is the scm usrname
class git::configure(
  $scm_user=false,
  $scm_email=false,
  $user = false
) {

  validate_string($scm_user)
  validate_string($scm_email)
  validate_string($user)

  $home = "/home/${user}"

  define git_config($value) {
    exec {"set git ${name} ${value}":
      command     => "git config --global $name $value",
      path        => $::git::params::path,
      user        => 'root',
      environment => "HOME=${git::configure::home}",
      require     => Package[$::git::params::package],
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
  git_config {'alias.for-pull': value => "'submodule foreach git pull origin master'"}
  git_config {'http.sslVerify': value => 'false'}

  git::clone {'git_template':
    url   => 'git://github.com/narkisr/git_template.git',
    dst   => "${home}/.git_template",
    owner => $user
  }
}
