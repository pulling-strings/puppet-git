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

  git::option{'user.name': value => $scm_user}
  git::option{ 'user.email': value => $scm_email}
  git::option{ 'core.editor': value => 'vim'}
  git::option {'alias.sub-add': value => "'submodule add'"}
  git::option {'alias.sub-up': value => "'submodule update --init'"}
  git::option {'alias.cm': value => "'commit -m'"}
  git::option {'alias.for-pull': value => "'submodule foreach git pull origin master'"}
  git::option {'alias.for-master': value => "'submodule foreach git checkout master'"}
  git::option {'http.sslVerify': value => false}
}
