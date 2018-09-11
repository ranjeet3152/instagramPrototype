class Image < ApplicationRecord
	has_many :comments
	belongs_to :user

	#add state in image
	module State
		ACTIVE  = 1
		DELETED = 2
	end

	module Privileges
		PUBLIC  = 1
		PRIVATE = 2
	end

	#scope :visible_to_all, -> {:where(:priviledges => Privileges::PUBLIC)}

	#def self.create(path, caption, user_id, priviledges)
	#	image = Image.new( :path => path
	#			:caption => caption
	#			:user_id => user_id
	#			:priviledges => priviledges
	#	)
	#	image.save
	#	image
	#end

	def mark_deleted
		self.update_attributes!(:state => State::DELETED)
	end

	def basic_info
		{
			:caption => caption,
			:path => path,
			:user_id => user_id
		#	:comments => comments.collect { |comment| comment.basic_info }
		#	:user => user.basic_info
		}
	end

end
