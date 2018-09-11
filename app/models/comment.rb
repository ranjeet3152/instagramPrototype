class Comment < ApplicationRecord
	belongs_to :image

	def self.create(user_id, image_id, pic_comment)
		comment = Comment.new(
				:image_id => image_id
				:user_id => user_id
				:pic_comment => pic_comment
		)
		comment.save
		comment
	end

	def update_comment(pic_comment)
		self.update_attributes!(:pic_comment => pic_comment)
	end
end
