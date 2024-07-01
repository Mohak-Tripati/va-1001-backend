module Types
    class AddressInputType < Types::BaseInputObject
      
        argument :id, ID, required: false
        argument :address_line, String
        argument :city, String
        argument :state, String
        argument :zip_code, Integer
        argument :country, String
        argument :address_type, String

    end
  end