class git()
{
	file{"/etc/bash_completion.d/git":
                ensure => file,
                owner => $name,
                group => $name,
                mode => '0640',
                source => "puppet:///modules/git/etc/git-completion.bash"
        }
}
