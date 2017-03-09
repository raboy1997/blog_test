class Post < ApplicationRecord
  has_many :comments
  has_many :sub_comments
  belongs_to :user, required: true
  validates :user_id, presence: true
end
