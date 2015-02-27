require 'spec_helper'

describe VotesController do
  login_user

  describe '#create' do
    let(:user) { User.first }
    let(:vote_event) { Fabricate :vote_event }
    let(:valid_params) do
      Fabricate.attributes_for :vote,
        vote_event_id: vote_event.id
    end
    let(:invalid_params) do
      Fabricate.attributes_for :vote,
        user_id: nil,
        vote_event_id: vote_event.id
    end

    context 'valid params' do
      before { post :create, vote: valid_params }

      it { expect(response).to redirect_to user_path(user) }
      it 'returns a notice flash message' do
        expect(response.request.flash[:notice]).
          to eq 'Thank you for your vote! :)'
      end
    end

    context 'invalid params' do
      before { post :create, vote: invalid_params }

      it { expect(response).to redirect_to vote_events_path }
      it 'returns a notice flash message' do
        expect(response.request.flash[:notice]).
          to eq 'User can\'t be blank'
      end
    end
  end
end
