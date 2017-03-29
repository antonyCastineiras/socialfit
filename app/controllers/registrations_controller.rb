class RegistrationsController < Devise::RegistrationsController

  def update
  	self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
    	Cloudinary::Uploader.upload(params[:user][:avatar].tempfile, :public_id => "sofit/#{resource.avatar.filename.split('.')[0]}") if params[:user][:avatar]
      if is_flashing_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      bypass_sign_in resource, scope: resource_name
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

	protected

	def update_resource(resource, params)
		resource.update_without_password(params)
	end

	def account_update_params
		params.require(:user).permit(:username, :postcode, :avatar, :avatar_cache, :remove_avatar,:sport_list)
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
