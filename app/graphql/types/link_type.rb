module Types
  class LinkTyoes < BaseObject
    field :id, ID, null: false
    faild :url, String, null: false
    field :description, String, false
  end
end