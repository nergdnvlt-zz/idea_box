class Image < ApplicationRecord
  validates :src, presence: true
  validates :title, presence: true

  has_many :image_ideas
  has_many :ideas, through: :image_ideas
end
