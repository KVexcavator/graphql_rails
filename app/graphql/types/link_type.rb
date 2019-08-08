module Types
  class LinkType < BaseObject
    field :id, ID, null: false
    field :url, String, null: false
    field :description, String, null: false
    field :posted_by, UserType, null: true, method: :user
    field :snaps, [Types::SnapType], null: false
  end
end