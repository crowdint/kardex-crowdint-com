require 'spec_helper'

describe BadgeProposalsController do
  let(:valid_attributes) { Fabricate.attributes_for(:badge_proposal) }
  let(:badge_proposal) { Fabricate :badge_proposal }
  let(:badge) { Fabricate :badge }

  login_as(Fabricate :user)

   describe '#New' do
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
        post :create, { badge_proposal: valid_attributes }
        expect(response).to redirect_to user_path(subject.current_user)
      end
    end

    context 'when is invalid' do
      it 'should not redirect to badges to new' do
        post :create, { badge_proposal: { badge_id: ''} }

        expect(response).to render_template 'new'
      end
    end
  end
end
