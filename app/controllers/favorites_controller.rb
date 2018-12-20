class FavoritesController < ApplicationController
  def create
  	user = current_user
  	artist = Artist.find(params[:artist_id])
  	if Favorite.create(user_id: user.id, artist_id: artist.id)
  		redirect_to artist
  	else
  		redirect_to root_url
  	end
  end

  def destroy
  	user = current_user
  	artist = Artist.find(params[:artist_id])
  	if favorite = Favorite.find_by(user_id: user.id, artist_id: artist.id)
  		favorite.delete
  		redirect_to users_path(current_user)
  	else
  		redirect_to root_url
  	end
  end
end
