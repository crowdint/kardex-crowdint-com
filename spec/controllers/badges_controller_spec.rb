require 'spec_helper'

describe BadgesController do
  let(:badge) { Fabricate :badge }

  login_user

  describe '#index' do
    let(:action) { :index }

    before { get action }

    it_should_behave_like 'success rendering'
  end

  describe '#show' do
    let(:action) { :show }

    before { get action, id: badge.id }

    it_should_behave_like 'success rendering'
  end
end
