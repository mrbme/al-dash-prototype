class Widget < ApplicationRecord
  belongs_to :user
  validates :headline, presence: true, length: {minimum: 5, maximum: 50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
  validates :body, presence: true, length: {minimum: 10, maximum: 300}
  validates :caption, presence: true, length: {minimum: 10, maximum: 300}
  validates :user_id, presence: true
end
