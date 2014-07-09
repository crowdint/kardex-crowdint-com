require 'spec_helper'

describe ApplicationHelper do
  describe '#show_badges' do
    it 'returns a message if badges array is empty' do
      @badges = BadgesEngine::Badge.all
      expect(helper.show_badges).to eq 'You don\'t have badges... yet!'
    end
    it 'renders a partial if badges array is not empty' do
      Fabricate :badge
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

  describe '#image_badge' do
    it 'returns a default image tag' do
      badge = Fabricate.build(:badge)
      expect(helper.image_badge(badge)).
        to eq "<img alt=\"No image\" src=\"/assets/no-image.svg\" />"
    end
  end
end
