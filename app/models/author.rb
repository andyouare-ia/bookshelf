class Author < ApplicationRecord

  def full_name
    first_name.present? && last_name.present? ? "#{first_name} #{last_name}" : "#{last_name}"
  end

  def coordinates
    [rand(90), rand(90)]
  end

  # scalars array example
  def publication_years
    # fake data
    (1..rand(10)).to_a.map {1900 - rand(100)}
  end

end
