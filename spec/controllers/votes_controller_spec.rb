require 'spec_helper'

describe VotesController do
  login_user

  describe '#create' do
    let(:user) { User.first }
    let(:valid_params) { Fabricate.attributes_for :vote }
    let(:invalid_params) { Fabricate.attributes_for :vote, user_id: nil }

    context 'valid params' do
      before { post :create, vote: valid_params }

      it { expect(response).to redirect_to user_path(user) }
      it 'returns a notice flash message' do
        expect(response.request.flash[:notice]).
          to eq 'Thanks for your voto! :)'
      end
    end

    context 'invalid params' do
      before { post :create, vote: invalid_params }

      it { expect(response).to redirect_to votations_path }
      it 'returns a notice flash message' do
        expect(response.request.flash[:notice]).
          to eq 'Select an user for vote.'
      end
    end
  end
end
