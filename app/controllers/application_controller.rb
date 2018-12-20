class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	include SessionsHelper

	before_action :set_search

	def set_search
	 	@search = Artist.ransack(params[:q])
	 	@search_artists = @search.result
	end

	private

	def admin_user
		redirect_to(root_url) unless current_user.try(:admin?)
	end
end
