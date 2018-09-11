class User < ApplicationRecord


	def already_liked_the_image(image_id)
		image = self.images.where(:id => image_id)
		image.already_liked
	end
end
