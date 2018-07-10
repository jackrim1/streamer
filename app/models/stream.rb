class Stream < ApplicationRecord
	belongs_to :user
	default_scope -> { order(created_at: :desc) }
	mount_uploader :picture, PictureUploader
	validates :user_id, presence: true
	acts_as_votable
	#validate :picture_size

	private

	def picture_size
		if picture_size > 5.megabytes
			errors.add(:picture, "Should be less than 5MB")
		end
	end
end
