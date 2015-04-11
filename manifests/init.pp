# Git managment module
class git {

  include ::git::params

  ensure_resource('package',$::git::params::package,{'ensure' => 'present'})
}
