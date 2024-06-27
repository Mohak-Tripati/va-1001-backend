class User < ApplicationRecord
    belongs_to :company
    has_many :user_group_mappings, dependent: :destroy
    has_many :groups, through: :user_group_mappings

    has_many :user_company_address_mappings, dependent: :destroy
    has_many :addresses, through: :user_company_address_mappings
end
