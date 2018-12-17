class CartsController < ApplicationController
  	def index
  	end

  	def show
  	end

  	def add_item
  		if 	current_user.cart_id == nil
			cart = Cart.new
			cart.user_id = current_user.id
			session[:cart_id] = cart_id
			cart.save
			user = User.find(current_user.id)
			user.cart_id = cart.id
			User.save
		else
			session[:cart_id] = current_user.cart_id
			cart = Cart.find(params[:cart_id])
		end

		cart_item = current_user.cart.cart_items.find_by(cd_id: params[:cd_id])

		if 	cart_item.blank?
			cart_item = current_user.cart.cart_items.biuld(cd_id: params[:cd_id])
			cart_item.quantity = 1
		else
			cart_item.quantity += 1
		end
		@cart_item = cart_item
		@cart_item.save
		flash[:notice] = 'success!!'
		redirect_to cds_path
  	end


end
