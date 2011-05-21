class git::configure($git_user="", $git_email="") {
  	exec{"set git global user":
  		command	=> "git config --global user.name $git_user",
  		path        => ["/usr/bin", "/usr/sbin"],
  		user    	=> "root",
  		subscribe	=>  Package["git-core"], 
  		refreshonly => true
  	}

  	exec{"set git global email":
  		command	=> "git config --global user.email $git_email",
  		path        => ["/usr/bin", "/usr/sbin"],
  		user	      => "root",
  		subscribe	=>  Package["git-core"],
  		refreshonly => true
  	}

  	exec{"set git global editor":
  		command	=> "git config --global core.editor vim",
  		path        => ["/usr/bin", "/usr/sbin"],
  		user	      => "root",
  		subscribe	=>  Package["git-core"],
  		refreshonly => true
  	}
}
