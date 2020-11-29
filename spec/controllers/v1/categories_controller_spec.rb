require 'rails_helper'

RSpec.describe V1::CategoriesController, type: :controller do
  describe 'POST /v1/categories - Create category' do
    it 'should can create a new category for user' do
      user = create(:user)
      auth_sign_in(user)

      post :create, params: {
        name: Faker::Name.name,
        categorization_type: "User",
        categorization_id: user.id
      }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['name']).not_to be_empty
    end

    it 'should can create a new category for task' do
      task = create(:task)
      auth_sign_in(task.user)

      post :create, params: {
        name: Faker::Name.name,
        categorization_type: "Task",
        categorization_id: task.id
      }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['name']).not_to be_empty
    end

    it 'should return error if name is nil' do
      user = create(:user)
      auth_sign_in(user)

      post :create, params: {
        name: nil,
        categorization_type: "User",
        categorization_id: user.id
      }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body)['data'].first).to include(I18n.t('errors.messages.blank'))
    end
  end
  
  describe 'GET /v1/categories - All categories' do
    it 'should return category by type' do
      category = create(:category)
      auth_sign_in(category.categorization)

      get :index, params: { type: category.categorization.class.to_s }

      expect(response.content_type).to eq('application/json; charset=utf-8')
      expect(response).to have_http_status(:ok)
    end
  end
end
