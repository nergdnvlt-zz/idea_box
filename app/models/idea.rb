class Idea < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :user, presence: true

  belongs_to :category
  belongs_to :user

  has_many :image_ideas, dependent: :destroy
  has_many :images, through: :image_ideas
end
