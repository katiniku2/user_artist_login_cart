class ArtistsController < ApplicationController
	def new
		@artist = Artist.new
	end

	def create
		@artist = Artist.new(artist_params)
		if @artist.save
			log_in_artist @artist
			flash[:success] = "Welcome to the Sample App!"
			redirect_to artist_show_path(@artist)
		else
			render 'new'
		end
	end

	def show
		@artist = Artist.find(params[:id])
	end

private
	def artist_params
		params.require(:artist).permit(:name, :email, :password, :password_confirmation)
	end
end
