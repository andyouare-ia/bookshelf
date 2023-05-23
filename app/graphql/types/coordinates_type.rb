class Types::CoordinatesType < Types::BaseObject

  # declare fields
  field :latitude, Float, null: true
  field :longitude, Float, null: true

  # resolver methods for each field
  def latitude
    # first element of the array [rand(90), rand(90)]
    object.first
  end

  def longitude
    # second element of the array [rand(90), rand(90)]
    object.last
  end
end
