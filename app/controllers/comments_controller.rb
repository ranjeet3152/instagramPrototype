class CommentsController < ApplicationController

	before_action :load_image, :except => [:create]
	before_action :load_user
	before_action :load_comment

	def update
		if params[:comments].present?
			@comment.update_attributes!(:pic_comment => params[:comments])
		end
		render :json => @comment.basic_info
	end

	def create
		comment = Comment.create(@user.id, @image.id, params[:comment])
		render :json => @image.basic_info
	end

	def delete
		@comment.mark_deleted
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

	def load_comment
		@comment = Comment.find(params[:comment_id])
	end
end
