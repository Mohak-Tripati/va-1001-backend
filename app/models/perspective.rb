class Perspective < ApplicationRecord
    has_many :groups, dependent: :destroy
    
    has_many :perspective_user_mappings, dependent: :destroy
    has_many :users, through: :perspective_user_mappings
end
