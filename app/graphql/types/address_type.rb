# frozen_string_literal: true

module Types
    class AddressType < Types::BaseObject
        #write field when you are fetching and "argument" when you are using it for mutation in mutation directory
      
        field :id, ID, null: false
        field :address_line, String
        field :city, String
        field :state, String
        field :zip_code, Integer
        field :country, String
        field :address_type, String

    end
  end