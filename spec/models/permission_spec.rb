require 'rails_helper'

RSpec.describe Permission, type: :model do
  describe 'test allow? visitors branches' do
    it 'tests visitors to sessions' do
      permission = Permission.new(:user)
      expect(permission.allow?('sessions', 'index')).to eq(true)
      expect(permission.allow?('sessions', 'new')).to eq(true)
    end

    it 'tests visitors to users' do
      permission = Permission.new(:user)
      expect(permission.allow?('users', 'show')).to eq(true)
      expect(permission.allow?('users', 'new')).to eq(true)
    end

    it 'tests visitors to users' do
      permission = Permission.new(:user)
      expect(permission.allow?('welcome', 'index')).to eq(true)
    end
  end
end
