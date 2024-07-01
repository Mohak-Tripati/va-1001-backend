module Types
    class CompanyType < Types::BaseObject
      
        field :id, ID, null: false
        field :company_name, String
        field :industry_type, String
        field :company_size, Integer
        field :website_link, String
        field :access_url, String
        field :time_zone, GraphQL::Types::ISO8601DateTime
        field :company_logo, String
        field :custom_domain, String
        field :fiscal_type, String
        field :num_of_months, Integer
        field :start_month, String
        field :end_month, String
        field :hierarchy_preference, String
        field :reporting_manager, String

    end
  end