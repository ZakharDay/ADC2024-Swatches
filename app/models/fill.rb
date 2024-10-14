class Fill < ApplicationRecord
  has_many :colors
  belongs_to :user
  belongs_to :swatch
end
