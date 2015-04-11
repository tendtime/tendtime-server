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
  family: "Rectangular Mullion",
  title: "64 x 128 rectangular",
  unit: "mm"
)

Product.create(
  family: "System Panel",
  title: "Glazed",
  unit: "m2"
)

Product.create(
  family: "Basic Roof",
  title: "SG Metal panel roof",
  unit: "m3"
)

Product.create(
  family: "Basic Wall",
  title: "SIP 202mm Wall - conc clad",
  unit: "m3"
)
Product.create(
  family: "Basic Wall",
  title: "Cavity waill sliders",
  unit: "m3"
)
Product.create(
  family: "Basic Wall",
  title: "Interior - Partition",
  unit: "m3"
)
Product.create(
  family: "Basic Wall",
  title: "Retaining - 300mm concrete",
  unit: "m3"
)

Product.create(
  family: "Curtain Wall",
  title: "SH. Curtain Wall",
  unit: "m3"
)
