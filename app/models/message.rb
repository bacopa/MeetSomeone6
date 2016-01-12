class Message < ActiveRecord::Base

	validates :content, length: { minimum: 2, maximum: 150,
    too_long: "Message length should be within 2 and 150 characters." }

	belongs_to :user
end
