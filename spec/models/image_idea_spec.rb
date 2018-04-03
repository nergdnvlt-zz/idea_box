require 'rails_helper'

RSpec.describe ImageIdea, type: :model do
  describe 'Validations' do
    it { validate_presence_of :image_id }
    it { validate_presence_of :idea_id }
  end

  describe 'Relationships' do
    it { should belong_to(:idea) }
    it { should belong_to(:image) }
  end
end
