class People < ApplicationRecord
  belongs_to :project
  has_many :ratings, dependent: :destroy
end
