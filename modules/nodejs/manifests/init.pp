class nodejs($user = 'warren')
{
    file { '/etc/apt/sources.list.d/yarn.list':
		ensure => present,
		content => 'deb https://dl.yarnpkg.com/debian/ stable main'
	}
    ~> exec { 'curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -':
        path => $::path,
		refreshonly => true
    }
    ~> Exec['update apt']
    -> package{'yarn':}
    
    exec { 'curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash':
        user => $user,
        path => $::path,
        creates => "/home/${user}/.nvm/nvm.sh"
    }
    # https://github.com/sindresorhus/fkill-cli
    -> exec { "/bin/bash -c 'source /home/${user}/.nvm/nvm.sh && nvm install 8.9.3 && /home/${user}/.yarn/bin/yarn global add mirri diff-so-fancy fkill-cli'":
        path => $::path,
        user => $user
    }
}