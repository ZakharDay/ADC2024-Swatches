class Post < ApplicationRecord
  belongs_to :user
  belongs_to :swatch
  has_many :comments
end
