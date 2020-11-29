require 'rails_helper'

RSpec.describe V1::SubtasksController, type: :controller do
  describe 'POST /v1/projects/:project_id/tasks/:task_id/subtasks - Create new subtask' do
    it 'should can create new subtask' do
      task = create(:task)
      auth_sign_in(task.user)

      post :create, params: {
        project_id: task.project.id,
        task_id: task.id,
        user_id: task.user.id,
        name: task.name,
        priority: task.priority
      }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['name']).not_to be_empty
    end
  end
end
