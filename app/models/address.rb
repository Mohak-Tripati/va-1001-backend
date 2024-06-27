class Address < ApplicationRecord

    has_many :user_company_address_mappings, dependent: :destroy
    has_many :users, through: :user_company_address_mappings
    has_many :companies, through: :user_company_address_mappings
end
