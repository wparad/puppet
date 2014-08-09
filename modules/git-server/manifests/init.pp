class git-server()
{
	users::create_user{'git':
                ingroups => ['git', 'users'],
                user_shell => '/usr/bin/git-shell',
                id => '1001'
        }
	-> file{'/git':
                ensure => directory,
                owner => git,
                group => git,
                mode => 0770
        }

	
}
