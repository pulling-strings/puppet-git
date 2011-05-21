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
class git($user,$email) {
 
  include git::install 
  class { "git::configure":  git_user => $user, git_email => $email}

}
