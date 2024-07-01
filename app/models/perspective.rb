class Perspective < ApplicationRecord
    has_many :groups, dependent: :destroy

    
    has_many :perspective_user_mappings, dependent: :destroy
    has_many :users, through: :perspective_user_mappings

    has_many :holiday_details, dependent: :destroy
    has_many :business_schedules, dependent: :destroy
    has_many :currencies, dependent: :destroy


end
