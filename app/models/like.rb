class Like < ApplicationRecord

	module State
		TRUE  = 1
		FALSE = 2
	end

	def self.create(user_id, image_id)
		like = Like.new(
				:image_id => image_id
				:user_id => user_id
		)
		like.save
		like
	end

	def update_state(state)
		self.update_attributes!(:state => state)
	end

	def already_liked
		self.state == State::TRUE
	end
end
