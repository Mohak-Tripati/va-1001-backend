# class Mutations::EditUser < Mutations::BaseMutation
#     # patch query, since we are using required false
#     argument :id, ID, required: true
#     argument :first_name, String, required: false
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

#     def resolve(id:, first_name: nil, middle_name: nil, last_name: nil, work_email_address: nil, prefered_language: nil, ai_assistant: nil, profile_image: nil, whatsapp_number: nil, mobile_number: nil)
#         user = User.find_by(id: id)
#         if user.nil?
#           {
#             user: nil,
#             errors: ['User not found']
#           }
#         else
#           user.first_name = first_name if first_name
#           user.middle_name = middle_name if middle_name
#           user.last_name = last_name if last_name
#           user.work_email_address = work_email_address if work_email_address
#           user.prefered_language = prefered_language if prefered_language
#           user.ai_assistant = ai_assistant if ai_assistant
#           user.profile_image = profile_image if profile_image
#           user.whatsapp_number = whatsapp_number if whatsapp_number
#           user.mobile_number = mobile_number if mobile_number
#           if user.save
#             {
#               user: user,
#               errors: []
#             }
#           else
#             {
#               user: nil,
#               errors: user.errors.full_messages
#             }
#           end
#         end
#       end
# end



# class Mutations::UpdateUser < Mutations::BaseMutation
#     argument :id, ID, required: true
#     argument :first_name, String, required: false
#     argument :middle_name, String, required: false
#     argument :last_name, String, required: false
#     argument :work_email_address, String, required: false
#     argument :prefered_language, String, required: false
#     argument :ai_assistant, String, required: false
#     argument :profile_image, String, required: false
#     argument :whatsapp_number, String, required: false
#     argument :mobile_number, String, required: false
#     argument :addresses,[Types::AddressInputType] , required: false
  
#     field :user, Types::UserType, null: false
#     field :errors, [String], null: false
  
#     def resolve(args)
#       user = User.find_by(id: args[:id])
#       return { user: nil, errors: ['User not found'] } if user.nil?
  
#       if user.update(args.except(:id))
#         { user: user, errors: [] }
#       else
#         { user: nil, errors: user.errors.full_messages }
#       end
#     end
#   end



  class Mutations::UpdateUser < Mutations::BaseMutation
    argument :id, ID, required: true
    argument :first_name, String, required: false
    argument :middle_name, String, required: false
    argument :last_name, String, required: false
    argument :work_email_address, String, required: false
    argument :prefered_language, String, required: false
    argument :ai_assistant, String, required: false
    argument :profile_image, String, required: false
    argument :whatsapp_number, String, required: false
    argument :mobile_number, String, required: false
    argument :addresses, [Types::AddressInputType], required: false
  
    field :user, Types::UserType, null: true
    field :errors, [String], null: false
  
    def resolve(args)
      user = User.find_by(id: args[:id])
      return { user: nil, errors: ['User not found'] } if user.nil?
      
      if user.update(args.except(:id, :addresses))
        address_update_errors = []
  
        if args[:addresses]
          args[:addresses].each do |address_attrs|
            address = Address.find_or_initialize_by(id: address_attrs[:id])
            # unless address.update(address_attrs.except(:id))
            unless address.update(address_attrs.to_h)
              address_update_errors << address.errors.full_messages
            end
  
            address_mapping = UserCompanyAddressMapping.find_or_initialize_by(user_id: user.id, address_id: address.id, company_id: nil)
            unless address_mapping.update(address_id: address.id, user_id: user.id, company_id: nil)
              address_update_errors << address_mapping.errors.full_messages
            end
          end
        end
  
        if address_update_errors.flatten.empty?
          { user: user, errors: [] }
        else
          { user: user, errors: address_update_errors.flatten }
        end
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
  
  