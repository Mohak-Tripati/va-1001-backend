class Group < ApplicationRecord
  belongs_to :perspective
  has_many :themes, dependent: :destroy
  has_many :user_group_mappings, dependent: :destroy
  has_many :users, through: :user_group_mappings
end
