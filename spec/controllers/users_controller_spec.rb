require 'spec_helper'

describe UsersController do
  login_user

  let(:user) { User.first }
  let(:user_params) { Fabricate.attributes_for :user, name: 'Luigi' }

  describe '#show' do
    let(:action) { :show }

    before { get action, id: user.id }

    it_should_behave_like 'success rendering'
  end

  describe '#edit' do
    let(:action) { :edit }

    before { get action, id: user.id }

    it_should_behave_like 'success rendering'
  end

  describe '#my_badges' do
    let(:action) { :my_badges }

    before { get action, id: user.id }

    it_should_behave_like 'success rendering'
  end

  describe 'update' do
    before { patch :update, id: user.id, user: user_params }

    it { expect(response).to redirect_to User.last }
  end
end
