require 'spec_helper'

describe ApplicationHelper do
  let!(:current_user) { Fabricate :user }
  let!(:badge) { Fabricate :badge, name: 'foo' }

  describe '#show_badges' do
    it 'returns a message if badges array is empty' do
      @badges = []
      expect(helper.show_badges).to eq 'You don\'t have badges... yet!'
    end
    it 'renders a partial if badges array is not empty' do
      allow(helper).to receive(:current_user).and_return(current_user)
      @badges = BadgesEngine::Badge.all
      expect(helper.show_badges).to render_template 'shared/_badge'
    end
  end

  describe '#define_badge_column' do
    it 'returns badge if the controller and action match' do
      params = { action: 'show', controller: 'users' }
      allow(helper).to receive(:params).and_return(params)
      expect(helper.define_badge_column).to eq 'badge'
    end
    it 'returns badge 6 col if the controller and action does not match' do
      params = { action: 'index', controller: 'users' }
      allow(helper).to receive(:params).and_return(params)
      expect(helper.define_badge_column).to eq 'badge-6-col'
    end
  end

  describe '#unknown_image?' do
    it 'returns nil name if the badge belongs to the user' do
      current_user.badges << badge
      allow(helper).to receive(:current_user).and_return(current_user)
      expect(helper.unknown_image? badge).to eq nil
    end

    it 'returns the class name unless the badge belongs to the user' do
      allow(helper).to receive(:current_user).and_return(current_user)
      expect(helper.unknown_image? badge).to eq 'badge-unknown'
    end
  end

  describe '#badge_earn_icon?' do
    before do
      params = { action: 'show', controller: 'badges' }
      allow(helper).to receive(:params).and_return(params)
      allow(helper).to receive(:current_user).and_return(current_user)
    end

    context 'badge owned and controller is badges' do
      it 'returns a span element' do
        badge.users << current_user
        expect(helper.badge_earn_icon(badge)).
          to eq(content_tag :div, nil, class: 'badge-earned-icon')
      end
    end

    context 'badge is not owned or controller is not badges' do
      it 'returns nil' do
        expect(helper.badge_earn_icon(badge)).to eq nil
      end
    end
  end
end
