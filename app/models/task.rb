class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validate :validate_name_not_including_comma

  def validate_name_not_including_comma
    if name&.include?(',')
      errors.add(:name, 'にカンマを含める事はできません')
    end
  end
end
