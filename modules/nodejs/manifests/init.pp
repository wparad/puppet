class nodejs($user = 'warren')
{
    exec { 'curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -':
        path => $::path
    }
    -> file { '/etc/apt/sources.list.d/yarn.list':
		ensure => present,
		content => 'deb https://dl.yarnpkg.com/debian/ stable main'
	}
    ~> Exec['update apt']
    -> exec { 'curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash':
        user => $user,
        path => $::path,
        creates => "/home/${user}/.nvm/nvm.sh"
    }
    -> exec { "/bin/bash -c 'source /home/${user}/.nvm/nvm.sh && nvm install 8.9.3 && /home/${user}/.nvm/versions/node/v8.9.3/bin/npm install -g mirri diff-so-fancy'":
        path => $::path,
        user => $user
    }
}