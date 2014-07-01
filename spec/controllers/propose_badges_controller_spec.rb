require 'spec_helper'

describe ProposeBadgesController do
  let(:propose_badge) { Fabricate.attributes_for(:propose_badge) }
  let(:user) { User.first }

  login_user

  describe '#new' do
    before { get :new }

    it { expect(response).to be_success }
    it { expect(response).to render_template :new }
  end

  describe '#create' do
    context 'valid data' do
      before { post :create, propose_badge: propose_badge }

      it { expect(response).to redirect_to user_path(user) }
    end

    context 'invalid data' do
      before do
        invalid_propose_badge = propose_badge
        invalid_propose_badge[:name] = ''
        post :create, propose_badge: invalid_propose_badge
      end

      it { expect(response).to render_template :new }
    end
  end
end
