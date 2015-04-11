# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: 'barretalexandre@hotmail.com', password: '12341234' )

puts "nombre de user dans la DB: #{User.count}"


Supplier.create(company_name: 'Mitre 10', contact_name: 'Jane Doe')

Product.create(
  family: "Basic Wall",
  title: "SIP 202mm Wall - conc clad",
  price_per_unit: 1000,
  unit: "m3"
)
Product.create(
  family: "Basic Wall",
  title: "Cavity waill sliders",
  price_per_unit: 1000,
  unit: "m3"
)
Product.create(
  family: "Basic Wall",
  title: "Interior - Partition",
  price_per_unit: 1000,
  unit: "m3"
)
Product.create(
  family: "Basic Wall",
  title: "Retaining - 300mm concrete",
  price_per_unit: 1000,
  unit: "m3"
)
