require 'spec_helper'

describe BadgesEngine::BadgesController do
  routes { BadgesEngine::Engine.routes }
  let!(:badge) { create(:badge) }
  let(:new_badge) { attributes_for(:badge, name: 'test') }

  describe '#index' do
    let(:action) { :index }

    before { get action }

    it_should_behave_like 'success response'
  end

  describe '#show' do
    let(:action) { :show }

    before { get action, id: badge.id }

    it_should_behave_like 'success response'
  end

  describe '#new' do
    let(:action) { :new }

    before { get action }

    it_should_behave_like 'success response'
  end

  describe '#edit' do
    let(:action) { :edit }

    before { get action, id: badge.id }

    it_should_behave_like 'success response'
  end

  describe '#create' do
    context 'valid data' do
      before { post :create, badge: new_badge }

      it 'redirects to #index page' do
        expect(response).to redirect_to badges_path
      end
    end

    context 'invalid data' do
      before do
        invalid_badge = new_badge
        invalid_badge[:name] = badge.name
        post :create, badge: invalid_badge
      end

      it 'renders #new page' do
        expect(response).to render_template :new
      end
    end
  end

  describe '#update' do
    context 'valid data' do
      before { patch :update, id: badge.id, badge: new_badge }

      it 'redirects to #show page' do
        expect(response).to redirect_to badges_path
      end
    end

    context 'invalid data' do

      before do
        invalid_badge = new_badge
        invalid_badge[:name] = ''
        patch :update, id: badge.id, badge: new_badge
      end

      it 'renders #edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe '#destroy' do
    before { delete :destroy, id: badge.id }

    it 'redirects to #index page' do
      expect(response).to redirect_to badges_path
    end

    it 'deletes the record in the database' do
      expect(BadgesEngine::Badge.count).to eq 0
    end
  end
end
