class LikesController < ApplicationController

	before_action :load_image, :except => [:create]
	before_action :load_user
	before_action :load_comment

	def update
		if @user.already_liked_the_image(params[:image])
			state = Like::State::TRUE
		else
			state = Like::State::FALSE
		end
		@liked_image.update_attributes!(:state => state)
		render :json => @image.basic_info
	end

	private
	def load_image
		@image = Image.find(params[:image_id])
		if !@image
			render :plain => "Something went wrong. Please try again."
#			render :status => :unprocessable_entity, :json => {:message => "Something went wrong. Please try again."}
		end
	end
end
