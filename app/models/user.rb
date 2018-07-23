class User < ApplicationRecord
	has_many :widgets
	before_save { self.email = email.downcase }
	validates :username, presence: true,
    uniqueness: { case_sensitive: false },
    length: { minimum: 3, maximum: 25 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	has_secure_password validations: false
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :password, presence: true, on: :create
	validates :email, presence: true, length: { maximum: 105 },
    uniqueness: { case_sensitive: false },
    format: { with: VALID_EMAIL_REGEX }
    validates :password, presence: true
end
