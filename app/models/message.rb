class Message < ApplicationRecord
  belongs_to :patient
  belongs_to :appointment

  validates :content, presence: true
end
