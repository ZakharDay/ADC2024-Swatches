class Fill < ApplicationRecord
  belongs_to :swatch
  has_many :colors
end
