class UserCompanyAddressMapping < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :address
  belongs_to :company, optional: true
end
