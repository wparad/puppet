define users::create_user($email = 'no-reply@gmail.com')
{
			file{"${user_home_dir}/.bashrc":
				ensure => file,
				owner => $name,
				group => $name,
				mode => 0644,
				source => "puppet:///modules/users/$name/.bashrc"
			}
			-> file{"${user_home_dir}/.gitconfig":
				ensure => file,
				owner => $name,
				group => $name,
				mode => 0640,
				source => "puppet:///modules/users/$name/.gitconfig"
			}
			-> file{"${user_home_dir}/.gnupg":
				ensure => directory,
				owner => $name,
				group => $name,
				mode => 0700
			}
			-> file{"${user_home_dir}/.gnupg/gpg.conf":
				ensure => file,
				owner => $name,
				group => $name,
				mode => 0600,
				source => "puppet:///modules/users/$name/.gnupg/gpg.conf"
			}
			-> file{"${user_home_dir}/.forward":
				ensure => present,
				owner  => $name,
				group  => $name,
				mode   => '0755',
				content => $email
			}
		}
}
