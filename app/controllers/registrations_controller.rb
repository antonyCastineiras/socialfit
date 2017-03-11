class RegistrationsController < Devise::RegistrationsController
	protected

	def after_sign_up_path_for(resource)
		user_home_path
	end

	def sign_up_params
		params.require(:user).permit(:email,:password,:password_confirmation,:username)
	end
end
