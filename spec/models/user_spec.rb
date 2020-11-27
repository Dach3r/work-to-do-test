require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:projects) }
    it { should have_many(:tasks) }
    it { should have_many(:categories) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:cellphone) }
    it { should validate_presence_of(:birthdate) }
  end
end
