require 'spec_helper'

describe NomineeListsController do
  let!(:nominee_list) { Fabricate :nominee_list }

  login_user

  shared_examples_for 'success response' do
    it { expect(response).to be_success }
    it { expect(response).to render_template action }
  end

  describe '#index' do
    let(:action) { :index }

    before { get action }

    it_should_behave_like 'success response'
  end

  describe '#show' do
    let(:action) { :show }

    before { get action, id: nominee_list.id }

    it_should_behave_like 'success response'
  end
end
