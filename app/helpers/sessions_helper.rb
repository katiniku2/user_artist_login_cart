module SessionsHelper

	def log_in(user)
		session[:user_id] = user.id
	end

	def log_in_artist(artist)
		session[:artist_id] = artist.id
	end

	def current_user
		if session[:user_id]
			@current_user ||= User.find_by(id: session[:user_id])
		end
	end

	def current_artist
		if session[:artist_id]
			@current_artist ||= Artist.find_by(id: session[:artisit_id])
		end
	end

	def logged_in?
		!current_user.nil?
	end

	def artist_logged_in?
		!current_artist.nil?
	end

	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	def log_out_artist
		session.delete(:artist_id)
		@current_artist = nil
	end
end
