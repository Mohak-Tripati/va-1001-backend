class PerspectiveUserMapping < ApplicationRecord
  belongs_to :user
  belongs_to :perspective
end
