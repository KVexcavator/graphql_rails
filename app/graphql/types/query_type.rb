module Types
  class QueryType < Types::BaseObject
    # allLinks resolver
    field :all_links, function: Resolvers::LinksSearch
  end
end
