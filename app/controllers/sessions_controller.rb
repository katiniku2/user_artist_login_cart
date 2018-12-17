class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def new_artist
    @artist = Artist.new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
  	else
  		render 'new'
  	end
  end

  def artist_create
    artist = Artist.find_by(email: params[:session][:email].downcase)
    if artist && artist.authenticate(params[:session][:password])
      log_in_artist artist
      redirect_to artist_show_path(artist)
    else
      render '/signup_artist'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

  def destroy_artist
    log_out_artist
    redirect_to root_url
  end
end
