class Post < ApplicationRecord
  belongs_to :user , required: true
  validates :user_id, presence: true

end
