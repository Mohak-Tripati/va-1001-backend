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

    field :createPerspective, mutation: Mutations::CreatePerspective
    field :updatePerspective, mutation: Mutations::UpdatePerspective
    field :deletePerspective, mutation: Mutations::DeletePerspective

    # company 
    field :createCompany, mutation: Mutations::CreateCompany
    field :updateCompany, mutation: Mutations::UpdateCompany
    field :deleteCompany, mutation: Mutations::DeleteCompany

    # holiday details
    field :createHolidayDetails, mutation: Mutations::CreateHolidayDetails
    field :updateHolidayDetails, mutation: Mutations::UpdateHolidayDetails
    field :deleteHolidayDetails, mutation: Mutations::DeleteHolidayDetails

    # business schedules
    field :createBusinessSchedule, mutation: Mutations::CreateBusinessSchedule
    field :updateBusinessSchedule, mutation: Mutations::UpdateBusinessSchedule
    field :deleteBusinessSchedule, mutation: Mutations::DeleteBusinessSchedule

    # currency
    field :createCurrency, mutation: Mutations::CreateCurrency
    field :updateCurrency, mutation: Mutations::UpdateCurrency
    field :deleteCurrency, mutation: Mutations::DeleteCurrency


    # department



  end
end
