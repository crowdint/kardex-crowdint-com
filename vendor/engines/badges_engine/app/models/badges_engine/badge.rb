module BadgesEngine
  class Badge < ActiveRecord::Base
    belongs_to :award
    belongs_to :value
    has_many :levels

    validates :name, presence: true, uniqueness: true

    accepts_nested_attributes_for :levels, allow_destroy: true

    scope :search_user_badges, ->(user, search) do
      user.badges.where('name ILIKE ?', "%#{ search }%")
    end

    scope :search_badges, ->(search) do
      where('name ILIKE ?', "%#{ search }%")
    end

    scope :sort_by_column_direction, ->(column = nil, direction = nil) do
      order("#{ Badge.get_column(column) } #{ Badge.get_direction(direction) }")
    end

    scope :search_by_letter, ->(letter) do
      where('name ILIKE ?', "#{ letter }%")
    end

    def self.get_column(column)
      column_names.include?(column) ? column : 'name'
    end

    def self.get_direction(direction)
      %w(asc desc).include?(direction) ? direction : 'asc'
    end

    mount_uploader :image, ImageUploader
  end
end
