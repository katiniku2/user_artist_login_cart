class ItemsController < ApplicationController

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
	  	if @item.save
	  		redirect_to cds_path
	  	else
	  		render :new
	  	end
  	end

  	private
  	def item_params
  		params.require(:item).permit(:name,:price,:artist_id)
  	end
end
