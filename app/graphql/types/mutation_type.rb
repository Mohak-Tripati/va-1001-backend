# frozen_string_literal: true




module Types
  class MutationType < Types::BaseObject

    field :createUser, mutation: Mutations::CreateUser
    field :updateUser, mutation: Mutations::UpdateUser
    field :deleteUser, mutation: Mutations::DeleteUser
    field :updateUserMapping, mutation: Mutations::UpdateUserMapping

    field :createPerspective, mutation: Mutations::CreatePerspective
    field :updatePerspective, mutation: Mutations::UpdatePerspective
    field :deletePerspective, mutation: Mutations::DeletePerspective

    field :createGroup, mutation: Mutations::CreateGroup
    field :updateGroup, mutation: Mutations::UpdateGroup
    field :deleteGroup, mutation: Mutations::DeleteGroup

    field :createTheme, mutation: Mutations::CreateTheme
    field :updateTheme, mutation: Mutations::UpdateTheme
    field :deleteTheme, mutation: Mutations::DeleteTheme

  end
end
