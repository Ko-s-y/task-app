class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  validate :validate_name_not_including_comma
  # before_validation :set_nameless_name

  belongs_to :user

  has_one_attached :image

  scope :recent, -> { order(created_at: :desc) }

  def self.csv_attributes
    ["name", "description", "created_at", "updated_at"]
  end

  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |task|
        csv << csv_attributes.map{|attr| task.send(attr) }
      end
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name created_at]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  private

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
