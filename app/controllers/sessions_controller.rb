class SessionsController < Devise::SessionsController

	protected

	def after_sign_in_path_for(resource)
		user_home_path
	end
end
