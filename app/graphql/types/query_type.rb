module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Here is where you define ROOT fields - fields that don't belong to anything
    # They will be entry points for queries on your schema.

    # Other ways of setting this up: creating separate files for each "resolver"

    field :author, Types::AuthorType, null: true, description: "Returns one author instance" do
      argument :id, ID, required: true
    end

    def author(id:)
      ::Author.find(id)
    end

    # array of higher types example
    field :authors, [Types::AuthorType], null: true, description: "Returns all the authors"

    def authors
      ::Author.all
    end

    # EXAMPLE:
    # Field type
    field :test_field, String, null: false,
      description: "An example field added by the generator" do
        # for arguments we create a block
        argument :name, String, required: true
      end
    # This method is called RESOLVER
    def test_field(name:)
      Rails.logger.info context[:time]
      "Hello #{name}!"
    end
  end
end
