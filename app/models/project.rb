class Project < ApplicationRecord
  has_many :persons, dependent: :destroy
  validates :title, presence: true
end
