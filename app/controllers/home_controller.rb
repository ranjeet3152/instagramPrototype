class HomeController < ApplicationController

	#before_action :load_user
	#before_action :load_image, :only => [:update_image_state, :add_comment, :like_image]

	def add_comment
		comment = Comment.create(@user.id, @image.id, params[:comment])
		render :json => @image.basic_info
	end

	def fetch_info
		user = User.find(params["user_id"])
		
	end

	def like_image
	end

	def update_caption
	end

	def load_user
		@user ||= User.find(params[:user_id])
	end

	def load_image
		@image = Image.find(params["image_id"])
		render :json => @image.basic_info
	end
end
