class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validate :validate_name_not_including_comma
  # before_validation :set_nameless_name

  def validate_name_not_including_comma
    if name&.include?(',')
      errors.add(:name, 'にカンマを含める事はできません')
    end
  end

  # def set_nameless_name
  #   if name.blank?
  #     self.name = "名前無し"
  #   end
  # end
end
