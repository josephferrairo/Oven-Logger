Fabricator(:oven_log) do
  customer        { Faker::Company.name }
  work_order      { Faker::Number.number(8) }
  purchase_order  { Faker::Number.number(7)}
  operator        { Faker::Name.first_name }

  stress_in       { Faker::Time.backward(14, :evening)}
  stress_out      { Faker::Time.forward(1, :evening)}
  stress_asset    { Faker::Hacker.abbreviation }

  her_in          { Faker::Time.backward(14, :evening)}
  her_out         { Faker::Time.forward(1, :evening)}
  her_asset       { Faker::Hacker.abbreviation }
end
