module Mutations
  class CreateLink < BaseMutation
    #arg pass to the resolver method
    argument :description, String, required: true
    argument :url, String, required: true

    # return rype from the mutatuin
    type Types::LinkType

    def resolve(description: nul, url: nul)
      Link.create!(
        description: description,
        url: url,
        user: context[:current_user]
      )
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
    end
  end
end