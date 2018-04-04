require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe 'Validations' do
    it { validate_presence_of :title }
    it { validate_presence_of :body }
    it { validate_presence_of :user }
  end

  describe 'Relationships' do
    it { should belong_to(:category) }
    it { should belong_to(:user) }
    it { should have_many(:image_ideas) }
    it { should have_many(:images) }
  end
end
