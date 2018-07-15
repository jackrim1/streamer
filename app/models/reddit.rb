class Reddit < ApplicationRecord
	belongs_to :stream
	belongs_to :user
end
