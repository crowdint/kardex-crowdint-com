require 'spec_helper'
require 'pry'

describe Admin::UsersController do
  login_admin

  describe 'Get: #index' do
    it 'Response should be success' do
      get :index
      expect(response).to be_success
    end

    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response.status).to eq(200)
    end
 
    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end

    it 'loads all of the users into @users' do
      user1, user2 = Fabricate(:user), Fabricate(:user)
 
      get :index
      expect(assigns(:users)).to include(user1, user2)
    end

    it 'search' do
      get :index, search: { name: "Kirstin Huel" }
      expect(response).to eql('Kirstin Huel')
    end
  end
end
