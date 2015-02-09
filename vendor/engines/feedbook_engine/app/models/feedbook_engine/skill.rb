class FeedbookEngine::Skill < ActiveRecord::Base
  self.table_name = 'feedbook_skills'

  has_many :questions

  before_save :lowercase_name

  scope :with_tag, ->(skill_names) { where('feedbook_skills.name in (:names) or feedbook_skills.category in (:names)', names: skill_names) }

  private

  def lowercase_name
    self.name = name.downcase
    self.category = category.downcase
  end
end
