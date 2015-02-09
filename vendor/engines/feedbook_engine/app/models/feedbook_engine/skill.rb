class FeedbookEngine::Skill < ActiveRecord::Base
  self.table_name = 'feedbook_skills'

  has_many :questions

  validates_uniqueness_of :name, scope: [:category]
  validates_presence_of :name, :category, :weight, :skill_type
  validates_inclusion_of :skill_type, in: ['technical']

  before_validation :lowercase_name

  scope :with_tag, ->(skill_names) { where('feedbook_skills.name in (:names) or feedbook_skills.category in (:names)', names: skill_names) }

  private

  def lowercase_name
    self.name = name.downcase
    self.category = category.downcase
    self.skill_type = skill_type.downcase
  end
end
