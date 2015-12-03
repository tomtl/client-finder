Fabricator(:user) do
  full_name { Faker::Name.name }
  email { Faker::Internet.email }
  password { Faker::Lorem.characters(6) }
end