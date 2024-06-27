class UserCompanyAddressMapping < ApplicationRecord
  belongs_to :user
  belongs_to :address
  belongs_to :company
end
