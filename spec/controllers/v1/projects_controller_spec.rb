require 'rails_helper'

RSpec.describe V1::ProjectsController, type: :controller do
  describe 'POST /v1/projects - Create project' do
    it 'should can create a new project' do
      user = create(:user)
      auth_sign_in(user)

      post :create, params: {
        name: Faker::Name.name,
        description: Faker::Lorem.paragraph,
        due_date: Faker::Date.in_date_period
      }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['name']).not_to be_empty
    end
  end

  describe 'GET /v1/projects/:id - Return specific project' do
    it 'should return success project' do
      project = create(:project)
      auth_sign_in(project.user)

      get :show, params: { id: project.id }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /v1/projects/:project_id/pending - Get tasks pending' do
    it 'should get all tasks with status pending' do
      task = create(:task, status: :pending)
      auth_sign_in(task.user)

      get :pending, params: { id: task.project.id }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /v1/projects/:id/users - Get all users associate to project' do
    it 'should get all users of project' do
      project = create(:project)
      auth_sign_in(project.user)

      get :users, params: { id: project.id }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT /v1/projects/:id - Update project' do
    it 'should can update a project' do
      project = create(:project)
      auth_sign_in(project.user)

      put :update, params: { id: project.id }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST /v1/projects/:id/add_user - Add new user to project' do
    it 'should return error if user not found' do
      project = create(:project)
      auth_sign_in(project.user)

      post :add_user, params: { id: project.id }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(JSON.parse(response.body)['data'].first).to eq(I18n.t('activerecord.models.user.not_found'))
    end

    it 'should return error if user owner of project' do
      project = create(:project)
      auth_sign_in(project.user)

      post :add_user, params: {
        id: project.id,
        email: project.user.email
      }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(JSON.parse(response.body)['data'].first).to eq(I18n.t('activerecord.models.project.not_permit_owner'))
    end

    it 'should return error if user owner of project' do
      project = create(:project)
      user = create(:user)
      auth_sign_in(project.user)

      post :add_user, params: {
        id: project.id,
        email: user.email
      }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(JSON.parse(response.body)['data'].first).to eq(I18n.t('activerecord.models.project.success_invitation', email: user.email))
    end
  end
end
