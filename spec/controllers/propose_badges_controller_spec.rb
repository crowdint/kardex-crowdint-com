require 'spec_helper'

describe ProposeBadgesController do
  let(:propose_badge) { Fabricate.attributes_for(:propose_badge) }
  let!(:admin) { Fabricate :admin }
  let(:user) { User.last }

  login_user

  describe '#create' do
    context 'valid data' do
      before { post :create, propose_badge: propose_badge }

      it { expect(response).to redirect_to user_path(user) }
    end

    context 'invalid data' do
      before do
        invalid_propose_badge = propose_badge
        invalid_propose_badge[:name] = ''
        request.env['HTTP_REFERER'] = root_url
        post :create, propose_badge: invalid_propose_badge
      end

      it { expect(response).to redirect_to :back }
    end
  end
end
