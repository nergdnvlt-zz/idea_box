class Image < ApplicationRecord
  validates :src, presence: true, uniqueness: true
  validates :title, presence: true

  has_many :image_ideas, dependent: :destroy
  has_many :ideas, through: :image_ideas
end
