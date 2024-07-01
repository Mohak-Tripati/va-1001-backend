# class Mutations::CreateUser < Mutations::BaseMutation
#     argument :first_name, String, required: true
#     argument :middle_name, String, required: false 
#     argument :last_name, String, required: false
#     argument :work_email_address, String, required: false
#     argument :prefered_language, String, required: false
#     argument :ai_assistant, String, required: false
#     argument :profile_image, String, required: false
#     argument :whatsapp_number, String, required: false
#     argument :mobile_number, String, required: false

  
#     field :user, Types::UserType, null: false
#     field :errors, [String], null: false
  
#     def resolve(first_name:, middle_name:, last_name:, work_email_address:, prefered_language:, ai_assistant:, profile_image:, whatsapp_number:, mobile_number:)
#       user = User.new(first_name: first_name, middle_name: middle_name, last_name: last_name, work_email_address: work_email_address, prefered_language: prefered_language, ai_assistant: ai_assistant, profile_image: profile_image, whatsapp_number: whatsapp_number, mobile_number: mobile_number)
#         if user.save
#         {
#              user: user,
#              errors: []
#         }
#       else
#         {
#             user: nil,
#           errors: user.errors.full_messages
#         }
#       end
#     end
#   end


  class Mutations::CreateUser < Mutations::BaseMutation
    argument :first_name, String, required: true
    argument :middle_name, String, required: false
    argument :last_name, String, required: false
    argument :work_email_address, String, required: false
    argument :prefered_language, String, required: false
    argument :ai_assistant, String, required: false
    argument :profile_image, String, required: false
    argument :whatsapp_number, String, required: false
    argument :mobile_number, String, required: false
    argument :company_id, ID, required: false
  
    field :user, Types::UserType, null: true
    field :errors, [String], null: false
  
    def resolve(args)
      user = User.new(args)
      if user.save
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end


  
  