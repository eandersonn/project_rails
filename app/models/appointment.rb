class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :category
  has_many :messages
  has_many :patients, through: :messages
  
  accepts_nested_attributes_for :category

  validates :title, presence: true

  def category_name
    category.try(:name)
  end
  
end
