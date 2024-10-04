class Swatch < ApplicationRecord
  has_many :fills
  belongs_to :project, optional: true
  validates :name, presence: true
end
