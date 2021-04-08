module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :test_field_with_arguments, String, null: false,
          description: "An example field added by me actually!" do
      argument :name, String, required: true
    end
    def test_field_with_arguments(name:)
      "Hello #{name}! You sent this request at #{context[:time]}"
    end

    field :all_links, [LinkType], null: false, description: 'this will show in graphiql'

    # this method is invoked, when `all_link` fields is being resolved
    def all_links
      Link.all
    end
  end
end
