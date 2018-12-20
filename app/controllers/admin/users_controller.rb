class Admin::UsersController < ApplicationController
	before_action :admin_user

	def index
		@users = User.all.order(created_at: :desc)
	end
end
