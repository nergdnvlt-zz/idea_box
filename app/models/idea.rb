class Idea < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :category

  has_many :image_ideas
  has_many :images, through: :image_ideas
end
