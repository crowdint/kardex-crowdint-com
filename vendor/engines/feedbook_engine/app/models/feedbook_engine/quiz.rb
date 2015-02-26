class FeedbookEngine::Quiz < ActiveRecord::Base
  self.table_name = 'feedbook_quizzes'

  # TODO: Add relation for many skills

  before_create :generate_random_uuid

  DURATIONS = [
    ['15 minutes', '900'],
    ['20 minutes', '1200'],
    ['30 minutes', '1800'],
    ['40 minutes', '2400'],
    ['45 minutes', '2700'],
    ['50 minutes', '3000'],
  ]

  def distribution_params
    values = [20, 50, 20, 10]
    values = distribution_rules.split('-').map{|item| item.to_i } if distribution_rules.present?
    values.to_json
  end

  private

  def generate_random_uuid
    self.uuid = SecureRandom.urlsafe_base64
  end
end
