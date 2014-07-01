require 'spec_helper'

describe NomineeUsersController do
  let(:valid_attributes) { Fabricate.attributes_for(:nominee_user) }
  let(:nominee_user) { Fabricate :nominee_user }
  let(:badge) { Fabricate :badge }

  login_admin

   describe '#new' do
    before { get :new }

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it 'renders the new template' do
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    context 'when success' do
      it "should have a current_user" do
        subject.current_user.should_not be_nil
      end

      it "redirects to user show" do
        post :create, { nominee_user: valid_attributes }
        expect(response).to redirect_to user_path(subject.current_user)
      end
    end

    context 'when is invalid' do
      it 'should not redirect to badges to new' do
        post :create, { nominee_user: { badge_id: ''} }

        expect(response).to render_template 'new'
      end
    end
  end
end
