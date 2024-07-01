class Perspective < ApplicationRecord
    has_many :groups, dependent: :destroy
    has_many :holiday_details, dependent: :destroy
    has_many :business_schedules, dependent: :destroy
    has_many :currencies, dependent: :destroy

end
