require 'rails_helper'

describe Idea do
  describe 'Validations' do
    it { validate_presence_of :title }
    it { validate_presence_of :body }
  end
end
