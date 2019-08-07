module Types
  class QueryType < Types::BaseObject
    # allLinks resolver
    field :all_links, [LinkType], null: false
    def all_links
      Link.all
    end

  end
end
