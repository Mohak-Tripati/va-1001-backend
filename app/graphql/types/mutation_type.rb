# frozen_string_literal: true




module Types
  class MutationType < Types::BaseObject

    field :createUser, mutation: Mutations::CreateUser
    field :editUser, mutation: Mutations::EditUser
    field :deleteUser, mutation: Mutations::DeleteUser

  end
end
