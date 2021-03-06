class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :body, presence: true
  validates :body, length: { maximum: 140 }
end
