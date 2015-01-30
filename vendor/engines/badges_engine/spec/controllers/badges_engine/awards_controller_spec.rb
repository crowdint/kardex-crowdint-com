require 'spec_helper'

module BadgesEngine
  describe AwardsController do
    routes { BadgesEngine::Engine.routes }
    let!(:award) { create(:award) }
    let(:new_award) { attributes_for(:award) }

    describe '#index' do
      let(:action) { :index }

      before { get action }

      it_should_behave_like 'success response'
    end

    describe '#show' do
      let(:action) { :show }

      before { get action, id: award.id }

      it_should_behave_like 'success response'
    end

    describe '#new' do
      let(:action) { :new }

      before { get action }

      it_should_behave_like 'success response'
    end

    describe '#edit' do
      let(:action) { :edit }

      before { get action, id: award.id }

      it_should_behave_like 'success response'
    end

    describe '#create' do
      context 'valid data' do
        before { post :create, award: new_award }

        it 'redirects to #show page' do
          expect(response).to redirect_to BadgesEngine::Award.last
        end
      end

      context 'invalid data' do
        before do
          invalid_award = new_award
          invalid_award[:title] = ''
          post :create, award: invalid_award
        end

        it 'renders #new page' do
          expect(response).to render_template :new
        end
      end
    end

    describe '#update' do
      context 'valid data' do
        before { patch :update, id: award.id, award: new_award }

        it 'redirects to #show page' do
          expect(response).to redirect_to award_path(award)
        end
      end

      context 'invalid data' do

        before do
          invalid_award = new_award
          invalid_award[:title] = ''
          patch :update, id: award.id, award: new_award
        end

        it 'renders #edit view' do
          expect(response).to render_template :edit
        end
      end
    end

    describe '#destroy' do
      before { delete :destroy, id: award.id }

      it 'redirects to #index page' do
        expect(response).to redirect_to awards_path
      end

      it 'deletes the record in the database' do
        expect(BadgesEngine::Award.count).to eq 0
      end
    end
  end
end
