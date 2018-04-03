require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Validations' do
    it { validate_presence_of :name }
  end

  describe 'Relationships' do
    it { should have_many(:ideas) }
  end
end
