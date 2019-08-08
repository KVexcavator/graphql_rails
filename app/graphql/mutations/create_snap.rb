module Mutations
  class CreateSnap < BaseMutation
    argument :link_id, ID, required: false

    type Types::SnapType

    def resolve(link_id: nul)
      Snap.create!(
        link: Link.find(link_id),
        user: context[:current_user]
      )
    end
  end
end