# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# First Establishment

Establishment.create(
  id: 1222579,
  name: 'SAI-LILA KHAMAN DHOKLA HOUSE',
  type: 'Food Take Out',
  address: '870 MARKHAM RD',
  status: 'Pass',
  min_inspections: 2)

## First Inspection

Inspection.create(
  id: 103329697,
  establishment_id: 1222579,
  date: '2014-09-09')

Infraction.create(
  inspection_id: 103329697,
  details: 'FAIL TO PROVIDE TOWELS IN FOOD PREPARATION AREA O. REG  562/90 SEC. 20(1)(C)',
  severity: 'S - Significant',
  action: 'Corrected During Inspection',
  court_outcome: '',
  amount_fined: 0)

Infraction.create(
  inspection_id: 103329697,
  details: 'Operator fail to properly maintain rooms',
  severity: 'M - Minor',
  action: 'Notice to Comply',
  court_outcome: '',
  amount_fined: 0)

Infraction.create(
  inspection_id: 103329697,
  details: 'Operator fail to properly wash equipment',
  severity: 'M - Minor',
  action: 'Notice to Comply',
  court_outcome: '',
  amount_fined: 0)

Infraction.create(
  inspection_id: 103329697,
  details: 'Operator fail to properly wash surfaces in rooms',
  severity: 'M - Minor',
  action: 'Notice to Comply',
  court_outcome: '',
  amount_fined: 0)

Infraction.create(
  inspection_id: 103329697,
  details: 'Operator fail to sanitize garbage containers as required',
  severity: 'M - Minor',
  action: 'Notice to Comply',
  court_outcome: '',
  amount_fined: 0)

## Second Inspection

Inspection.create(
  id: 103329697,
  establishment_id: 103420091,
  date: '2015-01-08')

Infraction.create(
  inspection_id: 103329697,
  details: 'Operator fail to properly wash equipment',
  severity: 'M - Minor',
  action: 'Notice to Comply',
  court_outcome: '',
  amount_fined: 0)

Infraction.create(
  inspection_id: 103329697,
  details: 'Operator fail to properly wash surfaces in rooms',
  severity: 'M - Minor',
  action: 'Notice to Comply',
  court_outcome: '',
  amount_fined: 0)

Infraction.create(
  inspection_id: 103329697,
  details: 'STORE UTENSILS IN MANNER NOT PREVENTING CONTAMINATION O. REG  562/90 SEC. 81',
  severity: 'S - Significant',
  action: 'Corrected During Inspection',
  court_outcome: '',
  amount_fined: 0)