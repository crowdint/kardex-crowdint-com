class Skill < ActiveRecord::Base
  has_and_belongs_to_many :users

  belongs_to :skill_type

  scope :filter_by_name,
    ->(name) { where(skill_type: SkillType.find_by(name: name)) }
end
