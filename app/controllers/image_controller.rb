class ImageController < ApplicationController

#	before_action :load_image, :except => [:create]
#	before_action :load_user

	def update
		if params[:caption].present?
			@image.pdate_attributes!(:caption => params[:caption])
		end
		render :json => @image.basic_info
	end

	def create
		debugger
		path = "" #API to be created store_image_path
		if @user.private_account
			priviledges = Image::Privileges::PRIVATE
		else
			priviledges = Image::Privileges::PUBLIC
		end
		image = Image.create(path, params[:caption], @user.id, priviledges)
		render :json => image.basic_info
	end

	def delete
		@image.mark_deleted
		render :json => @user.basic_info
	end

	def fetch_all_images
		resp = []
		Image.all.each { |image| 
			resp << image.basic_info
		}
		render :json => resp
	end

	def read
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
