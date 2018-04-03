require 'rails_helper'

RSpec.describe Idea, type: :model do
  describe 'Validations' do
    it { validate_presence_of :title }
    it { validate_presence_of :body }
  end

  describe 'Relationships' do
    it { should belong_to(:category) }
  end
end
