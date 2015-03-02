require 'spec_helper'

describe Admin::VoteEventsController do
  let(:vote_event) { Fabricate :vote_event }
  let(:vote_event_params) { Fabricate.attributes_for :vote_event }

  login_admin

  describe '#index' do
    let(:action) { :index }

    before { get action }

    it_should_behave_like 'success rendering'
  end

  describe '#previous' do
    let(:action) { :previous }

    before { get action }

    it_should_behave_like 'success rendering'
  end

  describe '#new' do
    let(:action) { :new }

    before { get action }

    it_should_behave_like 'success rendering'
  end

  describe '#show' do
    let(:action) { :show }

    before { get action, id: vote_event.id }

    it_should_behave_like 'success rendering'
  end

  describe '#update' do
    before { patch :update, id: vote_event.id, vote_event: vote_event.id }

    it { expect(response).to redirect_to admin_vote_events_path }
    it 'returns an notice flash message' do
      expect(response.request.flash[:notice]).
        to eq 'Vote event archived!'
    end
  end

  describe '#destroy' do
    before { delete :destroy, id: vote_event.id }

    it { expect(response).to redirect_to admin_vote_events_path }
    it 'returns an notice flash message' do
      expect(response.request.flash[:notice]).
        to eq 'Vote event deleted'
    end
  end

  describe '#create' do
    context 'valid params' do
      before { post :create, vote_event: vote_event_params }

      it { expect(response).to redirect_to admin_vote_events_path }
      it 'returns an notice flash message' do
        expect(response.request.flash[:notice]).
          to eq 'Vote event created successfully'
      end
    end

    context 'invalid params' do
      let(:invalid_params) do
        Fabricate.attributes_for(:vote_event, badge_id: nil)
      end

      it 'renders template new' do
        post :create, vote_event: invalid_params
        expect(response).to render_template :new
      end
    end
  end
end
