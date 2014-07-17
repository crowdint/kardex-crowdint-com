require 'spec_helper'

describe ApplicationHelper do
  let!(:current_user) { Fabricate :user }
  let!(:badge_3) { Fabricate :badge, name: 'foo' }

  describe '#show_badges' do
    xit 'returns a message if badges array is empty' do
      Fabricate :badge
      @badges = BadgesEngine::Badge.all
      expect(helper.show_badges).to eq 'You don\'t have badges... yet!'
    end
    xit 'renders a partial if badges array is not empty' do
      @badges = BadgesEngine::Badge.all
      expect(helper.show_badges).to render_template 'shared/_badge'
    end
  end

  describe '#define_badge_column' do
    it 'returns badge-info if the controller and action match' do
      params = { action: 'show', controller: 'users' }
      allow(helper).to receive(:params).and_return(params)
      expect(helper.define_badge_column).to eq 'badge-info'
    end
    it 'returns badge-info if the controller and action does not match' do
      params = { action: 'index', controller: 'users' }
      allow(helper).to receive(:params).and_return(params)
      expect(helper.define_badge_column).to eq 'badge-info-6-col'
    end
  end

  describe '#unknown_image?' do
    it 'returns nil name if the badge belongs to the user' do
      current_user.badges << badge_3
      allow(helper).to receive(:current_user).and_return(current_user)
      expect(helper.unknown_image? badge_3).to eq nil
    end

    it 'returns the class name unless the badge belongs to the user' do
      allow(helper).to receive(:current_user).and_return(current_user)
      expect(helper.unknown_image? badge_3).to eq 'unknown-image'
    end
  end
end
