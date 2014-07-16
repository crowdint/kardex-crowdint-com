class BadgeUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :badge, class_name: 'BadgesEngine::Badge'
end
