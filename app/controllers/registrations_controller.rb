class RegistrationsController < Devise::RegistrationsController
	

	protected

	def update_resource(resource, params)
		resource.update_without_password(params)
	end

	def account_update_params
		params.require(:user).permit(:username, :postcode)
	end 

	def after_update_path_for(resource)
		user_home_path(page: 'account_settings', page_update: true)
	end

	def after_sign_up_path_for(resource)
		user_home_path
	end

	def sign_up_params
		params.require(:user).permit(:email,:password,:password_confirmation,:username)
	end
end
