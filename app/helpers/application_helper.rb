module ApplicationHelper
  def single_location_map_link(address)
    "https://maps.google.com/maps/api/staticmap?size=400x300&
    sensor=false&zoom=12&markers=#{address}"
  end
end
