class Offer < ApplicationRecord
  enum status: [:active, :accepted, :rejected, :expired]

  belongs_to :project
  has_and_belongs_to_many :contacts
  has_many :tasks

  validates :name, presence: true
  has_many :notes, as: :topic
end
