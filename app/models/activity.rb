class Activity < ActiveRecord::Base

	validates :name, :location, presence: true

	has_attached_file :image, styles: { medium: "300x300", thumb: "100x100", mini: "50x50"}

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	belongs_to :user
	has_many :likes
	has_many :ppl, through: :likes, source: :user
	
end
