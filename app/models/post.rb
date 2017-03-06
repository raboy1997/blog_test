class Post < ApplicationRecord
  has_many :comments, :as => :commentable
  belongs_to :user , required: true
  validates :user_id, presence: true

end
