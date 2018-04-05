class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password

  has_many :ideas, dependent: :destroy

  enum role: %i[default admin]
end
