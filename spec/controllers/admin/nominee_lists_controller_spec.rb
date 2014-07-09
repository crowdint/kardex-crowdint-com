require 'spec_helper'

describe Admin::NomineeListsController do
  let(:badge) { Fabricate(:badge) }
  let(:valid_nominee_list) { Fabricate.attributes_for(:nominee_list) }

  login_admin

  describe '#new' do
    before { get :new }

    it { expect(response).to be_success }
    it { expect(response).to render_template :new }
  end

  describe '#create' do
    before { post :create, nominee_list: valid_nominee_list }

    it { expect(response).to redirect_to admin_root_path }
  end
end
