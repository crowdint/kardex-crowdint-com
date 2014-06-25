require 'spec_helper'

describe Admin::NomineeListsController do
  let(:badge) { Fabricate(:badge) }
  let(:valid_nominee_list) { Fabricate.attributes_for(:nominee_list) }

  login_as(Fabricate :user, is_admin: true)

  describe '#new' do
    before { get :new }

    it { expect(response).to be_success }
    it { expect(response).to render_template :new }
  end

  describe '#create' do
    context 'valid data' do
      before { post :create, nominee_list: valid_nominee_list }

      it 'redirects to #show page' do
        expect(response).to redirect_to admin_root_path
      end
    end

    context 'invalid data' do
      before do
        invalid_nominee_list = valid_nominee_list
        invalid_nominee_list[:badge_id] = nil
        post :create, nominee_list: invalid_nominee_list
      end

      it 'renders #new page' do
        expect(response).to render_template :new
      end
    end
  end
end
