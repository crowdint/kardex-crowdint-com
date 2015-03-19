require 'spec_helper'

describe NomineeListsController do
  let!(:nominee_list) { Fabricate :nominee_list }

  login_user

  describe '#index' do
    let(:action) { :index }

    before { get action }

    it_should_behave_like 'success rendering'
  end

  describe '#show' do
    let(:action) { :show }

    before { get action, id: nominee_list.id }

    it_should_behave_like 'success rendering'
  end
end
