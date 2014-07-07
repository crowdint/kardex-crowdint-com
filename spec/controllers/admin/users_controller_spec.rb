require 'spec_helper'

describe Admin::UsersController do
  login_admin

  describe 'Get: #index' do
    it 'Response should be success' do
      get :index
      expect(response).to be_success
    end
  end
end
