class Perspective < ApplicationRecord
    has_many :groups, dependent: :destroy
end
