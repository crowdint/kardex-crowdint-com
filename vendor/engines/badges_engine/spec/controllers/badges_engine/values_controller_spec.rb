require 'spec_helper'

module BadgesEngine
  describe ValuesController do
    routes { BadgesEngine::Engine.routes }
    let!(:value) { create(:value) }
    let(:new_value) { attributes_for(:value, name: 'Honestidad') }

    describe '#index' do
      let(:action) { :index }

      before { get action }

      it_should_behave_like 'success response'
    end

    describe '#show' do
      let(:action) { :show }

      before { get action, id: value.id }

      it_should_behave_like 'success response'
    end

    describe '#new' do
      let(:action) { :new }

      before { get action }

      it_should_behave_like 'success response'
    end

    describe '#edit' do
      let(:action) { :edit }

      before { get action, id: value.id }

      it_should_behave_like 'success response'
    end

    describe '#create' do
      context 'valid data' do
        before { post :create, value: new_value }

        it 'redirects to #show page' do
          expect(response).to redirect_to BadgesEngine::Value.last
        end
      end

      context 'invalid data' do
        before do
          invalid_value = new_value
          invalid_value[:name] = ''
          post :create, value: invalid_value
        end

        it 'renders #new page' do
          expect(response).to render_template :new
        end
      end
    end

    describe '#update' do
      context 'valid data' do
        before { patch :update, id: value.id, value: new_value }

        it 'redirects to #show page' do
          expect(response).to redirect_to value_path(value)
        end
      end

      context 'invalid data' do
        before do
          invalid_value = new_value
          invalid_value[:name] = ''
          patch :update, id: value.id, value: new_value
        end

        it 'renders #edit view' do
          expect(response).to render_template :edit
        end
      end
    end

    describe '#destroy' do
      before { delete :destroy, id: value.id }

      it 'redirects to #index page' do
        expect(response).to redirect_to values_path
      end

      it 'deletes the record in the database' do
        expect(BadgesEngine::Value.count).to eq 0
      end
    end
  end
end
