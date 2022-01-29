class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :body, presence: true, length: { minimum: 10 }

  has_noticed_notifications

  has_many_attached :images
end
