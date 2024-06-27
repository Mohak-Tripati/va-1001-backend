class Mutations::DeleteUser < Mutations::BaseMutation
    argument :id, ID, required: true
  
    field :user, Types::UserType, null: true
    field :errors, [String], null: false
  
    def resolve(id:)
      user = User.find_by(id: id)
      return { user: nil, errors: ['User not found'] } if user.nil?
  
      if user.destroy
        { user: user, errors: [] }
      else
        { user: nil, errors: user.errors.full_messages }
      end
    end
  end
  