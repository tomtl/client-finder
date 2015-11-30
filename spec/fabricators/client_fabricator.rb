Fabricator(:client) do
  first_name {Faker::Name.first_name}
  last_name {Faker::Name.last_name}
  address {"1 City Hall Square"}
  city {"Boston"}
  state {"MA"}
  zip {"02201"}
end
