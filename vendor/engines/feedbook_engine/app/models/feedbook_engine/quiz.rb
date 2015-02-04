class FeedbookEngine::Quiz < ActiveRecord::Base
  self.table_name = 'feedbook_quizzes'

  before_create :generate_random_uuid

  def distribution_params
    values = [20, 60, 20]
    values = distribution_rules.split('-').map{|item| item.to_i } if distribution_rules.present?
    values.to_json
  end

  private

  def generate_random_uuid
    self.uuid = SecureRandom.urlsafe_base64
  end
end
