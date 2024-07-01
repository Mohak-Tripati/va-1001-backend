class Mutations::CreateGroup < Mutations::BaseMutation
    argument :group_name, String, required: true
    argument :group_description, String, required: true
    argument :perspective_id, ID, required: true

  
  
    # field :user, Types::UserType, null: false
    field :group, Types::GroupType, null: false
    field :errors, [String], null: false
  
    def resolve(args)
      group = Group.new(args)
      if group.save
        { group: group, errors: [] }
      else
        { group: nil, errors: group.errors.full_messages }
      end
    end
  end