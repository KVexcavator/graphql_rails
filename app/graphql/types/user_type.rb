module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    # only for exemple, peodaction shouldn't lesk user email
    field :email, String, null: false
  end
end