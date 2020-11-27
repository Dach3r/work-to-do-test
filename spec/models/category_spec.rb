require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it { should belong_to(:categorization) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'scopes' do
    it 'should return all categories with a type association' do
      categories = Category.where(categorization_type: 'User')
      expect(Category.apply_filter('user').count).to eq(categories.count)
    end
  end
end
