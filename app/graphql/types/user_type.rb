# frozen_string_literal: true

module Types
    class UserType < Types::BaseObject
      
        field :id, ID, null: false
        field :first_name, String
        field :middle_name, String
        field :last_name, String
        field :work_email_address, String
        field :prefered_language, String
        field :ai_assistant, String
        field :profile_image, String
        field :whatsapp_number, Integer
        field :mobile_number, Integer
        field :password, String

    end
  end

# frontend -> gql -> ruby on rails -> database