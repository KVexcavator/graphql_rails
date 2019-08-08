module Types
  class UserType < BaseObject
    field :id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :name, String, null: false
    # only for exemple, prodaction shouldn't  user email
    field :email, String, null: false
    field :snaps, [Types::SnapType], null: false
    field :links, [Types::LinkType], null: false
  end
end