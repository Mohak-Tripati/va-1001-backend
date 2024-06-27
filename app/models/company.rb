class Company < ApplicationRecord

    has_many :users, dependent: :destroy
    has_many :holiday_details, dependent: :destroy
    has_many :business_schedules, dependent: :destroy
   
    has_many :currencies, dependent: :destroy


    has_many :user_company_address_mappings, dependent: :destroy
    has_many :addresses, through: :user_company_address_mappings

end
