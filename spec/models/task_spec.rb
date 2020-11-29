require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:project) }
    it { should have_many(:categories) }
    it { should have_many(:subtasks).with_foreign_key('task_id') }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:position) }
    it { should validate_inclusion_of(:priority).in_array(ConstantHelper::PRIORITY_LIST) }
    it { should validate_inclusion_of(:status).in_array(ConstantHelper::STATUS_LIST) }
  end

  describe 'scopes' do
    it 'should return all tasks with status pending' do
      tasks = Task.where(status: :pending)
      expect(Task.pending_board.count).to eq(tasks.count)
    end
  end
end
