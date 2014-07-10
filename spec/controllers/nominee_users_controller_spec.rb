require 'spec_helper'

describe NomineeUsersController do
  let(:valid_attributes) { Fabricate.attributes_for(:nominee_user) }
  let(:nominee_user) { Fabricate :nominee_user }
  let(:badge) { Fabricate :badge }

  login_admin

  describe '#create' do
    context 'when success' do
      before{ post :create, nominee_user: valid_attributes }

      it { expect(response).to redirect_to user_path(subject.current_user) }
    end

    context 'when is invalid' do
      it 'should not redirect to badges to new' do
        invalid_attributes = valid_attributes
        invalid_attributes[:why] =''
        request.env['HTTP_REFERER'] = root_url
        post :create, nominee_user: invalid_attributes
        expect(response).to redirect_to :back
      end
    end
  end
end
