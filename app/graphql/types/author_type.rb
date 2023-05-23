class Types::AuthorType < Types::BaseObject

  description "An author"

  # fields that belong to an author

  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: false
  field :yob, Int, null: false
  field :is_alive, Boolean, null: true
  field :created_at, GraphQL::Types::ISO8601DateTime, null: false

  # Two ways of creating Custom fields
  # 1 - define the custom field in the Author model, and using it here
  # Advantage: if it's defined in the model it can be accessed from other places of the app
  field :full_name, String, null: true

  # 2 - define the custom field here (`object` is an istance of an author)
  # Advantage; it keeps the logic of the field with its definition
  field :full_name_reversed, String, null: true
  def full_name_reversed
    object.first_name.present? && object.last_name.present? ? "#{object.last_name}, #{object.first_name}" : "#{object.last_name}"
  end

  # Custom Type example
  # I don't need a resolver, as in the Author model we have a method with the same name
  field :coordinates, Types::CoordinatesType, null: false

  # scalars array example
  field :publication_years, [Int], null: false

end
