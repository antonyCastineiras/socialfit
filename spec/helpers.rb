def create_user(email,username,password,password_confirmation)
	visit "/"
	find(:css, '#sign-up-form input[name="user[email]"]').set(email)
	find(:css, '#sign-up-form input[name="user[username]"]').set(username)
	find(:css, '#sign-up-form input[name="user[password]"]').set(password)
	find(:css, '#sign-up-form input[name="user[password_confirmation]"]').set(password_confirmation)
	click_on('Sign up')
end
