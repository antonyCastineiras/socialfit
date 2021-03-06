def create_user(email="user@one.com",username="user1",password="password",password_confirmation="password")
	visit "/"
	find(:css, '#sign-up-form input[name="user[email]"]').set(email)
	find(:css, '#sign-up-form input[name="user[username]"]').set(username)
	find(:css, '#sign-up-form input[name="user[password]"]').set(password)
	find(:css, '#sign-up-form input[name="user[password_confirmation]"]').set(password_confirmation)
	click_on('Sign up')
end

def create_event(name, info, start_time, postcode, open) 
	visit user_home_path
	click_link("Events")
	click_link("Create event")
	fill_in(:name, with: name)
	fill_in(:info, with: info)
	fill_in(:start_time, with: start_time)
	fill_in(:postcode, with: postcode)
	open ? choose('open_true') : choose('open_false')
	click_on('Create Event')
end 

def log_out
	click_link("Log Out")
end

def create_friend_request(user)
	click_link("Friends")
	fill_in(:email, with: user.email )
	click_on("Add Friend")
end

def log_in(user)
	visit "/"
	find(:css, '#sign-in-form input[name="user[email]"]').set(user.email)
	find(:css, '#sign-in-form input[name="user[password]"]').set(user.password)
	click_on("Log in")
end

def accept_friend_request
	click_link("Invites")
	click_on("Accept")
end

