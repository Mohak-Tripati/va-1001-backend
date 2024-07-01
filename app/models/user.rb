class User < ApplicationRecord
    belongs_to :company, optional: true
    
    has_many :user_group_mappings, dependent: :destroy
    has_many :groups, through: :user_group_mappings

    has_many :user_company_address_mappings, dependent: :destroy
    has_many :addresses, through: :user_company_address_mappings
   
    has_many :theme_user_mappings, dependent: :destroy
    has_many :themes, through: :theme_user_mappings
   
    has_many :perspective_user_mappings, dependent: :destroy
    has_many :perspectives, through: :perspective_user_mappings
end
