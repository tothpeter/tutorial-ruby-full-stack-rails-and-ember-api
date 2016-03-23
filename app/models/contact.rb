class Contact < ApplicationRecord
  belongs_to :company

  validates_presence_of :family_name, :given_names
end
