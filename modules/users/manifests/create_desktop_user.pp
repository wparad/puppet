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

			# https://askubuntu.com/questions/340809/how-can-i-adjust-the-default-passphrase-caching-duration-for-gpg-pgp-ssh-keys
			# Alternative if the below override does not work. Lauch dconf-editor.
			# Navigate to desktop - gnome - crypto - cache.
			# change gpg-cache-method to idle or timeout.
			# change gpg-cache-ttl to the number of seconds you want the passphrase to be cached.
			# idle means that the timer is reset each time you use the key before timeout is reached. timeout means that simply the time elapsed since entering the passphrase is considered.

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
			-> file{"${user_home_dir}/.gnupg/gpg-agent.conf":
				ensure => file,
				owner => $name,
				group => $name,
				mode => 0600,
				source => "puppet:///modules/users/$name/.gnupg/gpg-agent.conf"
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
