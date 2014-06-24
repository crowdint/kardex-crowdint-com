require 'spec_helper'

describe BadgeProposalsController do
  login_user

  def valid_attributes
    {
      badge_id: badge.id,
      user_id: user.id,
      why: Faker::Lorem.paragraph
    }
  end

  let(:badge_proposal) { Fabricate :badge_proposal }
  let(:user) { Fabricate :user }
  let(:badge) { Fabricate :badge }

   describe "Get '#New'" do
    before do
      get :new
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it 'renders the new template' do
      expect(response).to render_template("new")
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
