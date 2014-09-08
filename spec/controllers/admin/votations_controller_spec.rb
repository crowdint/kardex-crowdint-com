require 'spec_helper'

describe Admin::VotationsController do
  let(:votation_params) { Fabricate.attributes_for :votation }

  login_admin

  describe '#index' do
    let(:action) { :index }

    before { get action }

    it_should_behave_like 'success rendering'
  end

  describe '#new' do
    let(:action) { :new }

    before { get action }

    it_should_behave_like 'success rendering'
  end

  describe '#create' do
    context 'valid params' do
      before { post :create, votation: votation_params }

      it { expect(response).to redirect_to admin_root_path }
      it 'returns an error flash message' do
        expect(response.request.flash[:notice]).
          to eq 'Votation created successfully'
      end
    end

    context 'invalid params' do
      let(:invalid_params) do
        Fabricate.attributes_for(:votation, badge_id: nil)
      end

      it 'renders template new' do
        post :create, votation: invalid_params
        expect(response).to render_template :new
      end
    end
  end
end
