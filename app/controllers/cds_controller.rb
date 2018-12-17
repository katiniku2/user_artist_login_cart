class CdsController < ApplicationController
	def index
		@cds = Cd.all
		@items = Item.all
	end

	def new
		@cd = Cd.new
	  	
	end

	def create
		@cd = Cd.new(cd_params)
	  	if @cd.save
	  		redirect_to cds_path
	  	else
	  		render :new
	  	end
	end

	private
	def cd_params
		params.require(:cd).permit(:name,:price,:artist_id)
  	end
end
