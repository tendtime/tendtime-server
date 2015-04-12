# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

#suppliers
forman = Supplier.create(company_name: 'Forman Building Systems', contact_name: 'John Smith')
metro = Supplier.create(company_name: 'Metro Glass', contact_name: 'Anna Jones')
metal_craft = Supplier.create(company_name: 'Metal Craft', contact_name: 'Rachel Main')

#users
User.create(email: 'barretalexandre@hotmail.com', password: '12341234')
tom = User.create(email: 'tom.robinson@tendtime.co', password: 'password1', role: 'admin')
adam = User.create(email: 'adam@spatialsolutions.co.nz', password: 'password1', role: 'architect')
steve1 = User.create(email: 'steve@forman.co.nz', password: 'password1', role: 'supplier', supplier: forman)
steve2 = User.create(email: 'steve@metroglass.co.nz', password: 'password1', role: 'supplier', supplier: metro)
steve3 = User.create(email: 'steve@metalcraft.co.nz', password: 'password1', role: 'supplier', supplier: metal_craft)

#project
Project.create(name: "John Key's holiday house", description: 'Lake Taupo', budget: 3000000, user: adam)

#products
Product.create(
  family: "Rectangular Mullion",
  title: "64 x 128 rectangular",
  unit: "mm",
  supplier: metro,
  price_per_unit: 0.01
)

Product.create(
  family: "System Panel",
  title: "Glazed",
  unit: "m2",
  supplier: metro,
  price_per_unit: 84.56
)

Product.create(
  family: "Basic Roof",
  title: "SG Metal Panels roof",
  unit: "m2",
  supplier: metal_craft,
  price_per_unit: 15.47
)

Product.create(
  family: "Basic Wall",
  title: "SIP 202mm Wall - conc clad",
  unit: "m2",
  supplier: forman,
  price_per_unit: 13.0
)
Product.create(
  family: "Basic Wall",
  title: "Cavity wall_sliders",
  unit: "m2",
  supplier: forman,
  price_per_unit: 23.40
)
Product.create(
  family: "Basic Wall",
  title: "Interior - Partition",
  unit: "m2",
  supplier: forman,
  price_per_unit: 38.30
)
Product.create(
  family: "Basic Wall",
  title: "Retaining - 300mm Concrete",
  unit: "m2",
  supplier: forman,
  price_per_unit: 89.00
)

Product.create(
  family: "Curtain Wall",
  title: "SH_Curtain wall",
  unit: "m2",
  supplier: forman,
  price_per_unit: 108.20
)
