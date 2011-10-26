# Class: git
#
# This module manages git
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
# [Remember: No empty lines between comments and class definition]
class git() {
 
  include git::install 
  class { "git::configure":  git_user => $scm_user, git_email => $scm_email}

}
