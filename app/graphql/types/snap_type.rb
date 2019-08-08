module Types
  class SnapType < BaseObject
    field :id, ID, null: false
    field :useer, UserType, null: false
    field :link, LinkType, null: false
  end
end