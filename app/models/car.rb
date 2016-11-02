class Car < ApplicationRecord
  belongs_to :user
  validates_format_of :registration, with: /[a-zA-Z]{2}[0-9]{3}[a-zA-Z]{2}/
end
