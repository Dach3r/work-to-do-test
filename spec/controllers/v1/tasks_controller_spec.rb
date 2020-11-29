require 'rails_helper'

RSpec.describe V1::TasksController, type: :controller do
  describe 'GET /v1/projects/:id/tasks - All tasks' do
    it 'should return all tasks available if user dont have asession' do
      task = create(:task)

      get :index, params: { project_id: task.project.id }
      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
    end

    it 'should return all tasks available if user have a session' do
      task = create(:task)
      sign_in(task.user)

      get :index, params: { project_id: task.project.id }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(JSON.parse(response.body).first['name']).not_to be_empty
    end
  end

  describe 'GET /v1/projects/:id/tasks/:id - Return specific task' do
    it 'should return data if user is owner' do
      task = create(:task)
      sign_in(task.user)

      get :show, params: {
        id: task.id,
        project_id: task.project.id,
        user_id: task.user.id
      }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /v1/projects/:id/tasks - Create new task' do
    it 'should return error if user not have a session' do
      project = create(:project)
      post :create, params: {
        user_id: project.user.id,
        project_id: project.id
      }

      expect(response.body).to eq(I18n.t('devise.failure.unauthenticated'))
    end

    it 'should can create a task' do
      project = create(:project)
      sign_in(project.user)

      post :create, params: {
        user_id: project.user.id,
        project_id: project.id,
        name: Faker::Name.name,
        description: Faker::Lorem.paragraph,
        priority: ConstantHelper::PRIORITY_LIST.sample
      }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
    end

    it 'should return error if priority no exist' do
      project = create(:project)
      sign_in(project.user)

      post :create, params: {
        user_id: project.user.id,
        project_id: project.id,
        name: Faker::Name.name,
        description: Faker::Lorem.paragraph,
        priority: 'small'
      }

      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'should return error if have params empty' do
      project = create(:project)
      sign_in(project.user)

      post :create, params: {
        user_id: project.user.id,
        project_id: project.id,
        name: nil,
        description: Faker::Lorem.paragraph,
        priority: ConstantHelper::PRIORITY_LIST.sample
      }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(JSON.parse(response.body)['data'].first).to include(I18n.t('errors.messages.blank'))
    end
  end

  describe 'PUT /v1/projects/:project_id/tasks/:id - Update task' do
    it 'should can update a task' do
      task = create(:task)
      sign_in(task.user)

      put :update, params: {
        id: task.id,
        project_id: task.project.id
      }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /v1/projects/:project_id/tasks/:task_id/update_status - Update status task' do
    it 'should can update a task' do
      task = create(:task)
      sign_in(task.user)

      put :update_status, params: {
        id: task.id,
        project_id: task.project.id,
        status: ConstantHelper::STATUS_LIST
      }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
    end
  end
end
