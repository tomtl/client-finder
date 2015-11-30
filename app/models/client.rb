class Client < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_uniqueness_of :first_name, scope: :last_name

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [address, city, state, zip].compact.join(", ")
  end
end
