class User < ActiveRecord::Base
	has_secure_password

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX, message: "Please enter a valid email." }

	USERNAME_REGEX = /\A[a-z0-9][a-z0-9_\-]*\z/i
	validates :username, uniqueness: { case_sensitive: true }, format: { with:USERNAME_REGEX, message: "Username already taken OR must use only letters and numbers."}
	
	has_attached_file :image, styles: { medium: "300x300", thumb: "100x100#", mini: "50x50" }

	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	has_many :likes
	has_many :photos
	has_many :messages
	has_many :activities
	has_many :liked, through: :likes, source: :activity
	
end
