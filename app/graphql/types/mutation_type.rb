# frozen_string_literal: true




module Types
  class MutationType < Types::BaseObject

    field :createUser, mutation: Mutations::CreateUser
    field :editUser, mutation: Mutations::EditUser
    field :deleteUser, mutation: Mutations::DeleteUser

    field :createPerspective, mutation: Mutations::CreatePerspective
    field :updatePerspective, mutation: Mutations::UpdatePerspective
    field :deletePerspective, mutation: Mutations::DeletePerspective

  end
end
