require 'spec_helper'

module BadgesEngine
  describe LevelsController do
    routes { BadgesEngine::Engine.routes }
    let!(:level) { create(:level) }
    let(:new_level) { attributes_for(:level) }

    describe '#index' do
      let(:action) { :index }

      before { get action }

      it_should_behave_like 'success response'
    end

    describe '#show' do
      let(:action) { :show }

      before { get action, id: level.id }

      it_should_behave_like 'success response'
    end

    describe '#new' do
      let(:action) { :new }

      before { get action }

      it_should_behave_like 'success response'
    end

    describe '#edit' do
      let(:action) { :edit }

      before { get action, id: level.id }

      it_should_behave_like 'success response'
    end

    describe '#create' do
      context 'valid data' do
        before { post :create, level: new_level }

        it 'redirects to #show page' do
          expect(response).to redirect_to BadgesEngine::Level.last
        end
      end
    end

    describe '#update' do
      context 'valid data' do
        before { patch :update, id: level.id, level: new_level }

        it 'redirects to #show page' do
          expect(response).to redirect_to level_path(level)
        end
      end

    end

    describe '#destroy' do
      before { delete :destroy, id: level.id }

      it 'redirects to #index page' do
        expect(response).to redirect_to levels_path
      end

      it 'deletes the record in the database' do
        expect(BadgesEngine::Level.count).to eq 0
      end
    end
  end
end
