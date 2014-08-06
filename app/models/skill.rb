class Skill < ActiveRecord::Base
  has_and_belongs_to_many :users

  belongs_to :skill_type

  scope :filter_by_name,
    ->(name) { joins(:skill_type).where('skill_types.name' => name) }
end
