require 'spec_helper'

describe BadgesController do
  login_user

  describe '#index' do
    before { get :index }

    it { expect(response).to be_success }
    it { expect(response).to render_template :index }
  end
end
