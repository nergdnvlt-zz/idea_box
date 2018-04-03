require 'rails_helper'

RSpec.describe Image, type: :model do
  describe 'Validations' do
    it { validate_presence_of :src }
  end

  describe 'Relationships' do
    it { should have_many(:image_ideas) }
    it { should have_many(:ideas) }
  end
end
