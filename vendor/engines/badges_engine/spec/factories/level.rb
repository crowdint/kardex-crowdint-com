FactoryGirl.define do
  factory :level, class: BadgesEngine::Level do
    tier 2
    badge_alias 'Ambassador'
  end
end
