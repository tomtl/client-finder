class Client < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_uniqueness_of :first_name, scope: :last_name
  validates :address, presence: :true
  validates :city, presence: :true
  validates :state, presence: :true
  validates :zip, presence: :true

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [address, city, state, zip].compact.join(", ")
  end

  def full_name
    [first_name, last_name].compact.join(" ")
  end
end
