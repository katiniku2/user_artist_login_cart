class Admin::ArtistsController < ApplicationController
	before_action :admin_user

	def index
		@artists = Artist.all.order(created_at: :desc)
	end
end
