class Theme < ApplicationRecord
  belongs_to :group

  has_many :theme_user_mappings, dependent: :destroy
  has_many :users, through: :theme_user_mappings
end
