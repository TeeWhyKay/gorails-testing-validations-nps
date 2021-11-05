class Person < ApplicationRecord
  belongs_to :project
  belongs_to :rating
end
