class PagesController < ApplicationController
  def home
  	@new_user = User.new
  end
end
