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
  establishment_type: 'Food Take Out',
  address: '870 MARKHAM RD',
  min_inspections: 2)

## First Inspection

Inspection.create(
  id: 103329697,
  establishment_id: 1222579,
  date: '2014-09-09',
  status: 'Pass')

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
  id: 103420091,
  establishment_id: 1222579,
  date: '2015-01-08',
  status: 'Pass')

Infraction.create(
  inspection_id: 103420091,
  details: 'Operator fail to properly wash equipment',
  severity: 'M - Minor',
  action: 'Notice to Comply',
  court_outcome: '',
  amount_fined: 0)

Infraction.create(
  inspection_id: 103420091,
  details: 'Operator fail to properly wash surfaces in rooms',
  severity: 'M - Minor',
  action: 'Notice to Comply',
  court_outcome: '',
  amount_fined: 0)

Infraction.create(
  inspection_id: 103420091,
  details: 'STORE UTENSILS IN MANNER NOT PREVENTING CONTAMINATION O. REG  562/90 SEC. 81',
  severity: 'S - Significant',
  action: 'Corrected During Inspection',
  court_outcome: '',
  amount_fined: 0)

# Second Establishment

Establishment.create(
  id: 10380313,
  name: 'WAKAME SUSHI',
  establishment_type: 'Restaurant',
  address: '638 SHEPPARD AVE W',
  status: 'Pass',
  min_inspections: 3)

## First Inspection

Inspection.create(
  id: 103301226,
  establishment_id: 10380313,
  date: '2014-08-12',
  status: 'Pass')

Infraction.create(
  inspection_id: 103301226,
  details: 'Operator fail to properly wash equipment',
  severity: 'M - Minor',
  action: 'Notice to Comply',
  court_outcome: '',
  amount_fined: 0)

Infraction.create(
  inspection_id: 103301226,
  details: 'Operator fail to properly wash surfaces in rooms',
  severity: 'M - Minor',
  action: 'Notice to Comply',
  court_outcome: '',
  amount_fined: 0)

# Second Inspection

Inspection.create(
  id: 103368908,
  establishment_id: 10380313,
  date: '2014-11-19',
  status: 'Pass')

Infraction.create(
  inspection_id: 103368908,
  details: 'Operator fail to properly maintain rooms',
  severity: 'M - Minor',
  action: 'Notice to Comply',
  court_outcome: '',
  amount_fined: 0)

Infraction.create(
  inspection_id: 103368908,
  details: 'Operator fail to properly wash equipment',
  severity: 'M - Minor',
  action: 'Notice to Comply',
  court_outcome: '',
  amount_fined: 0)

Infraction.create(
  inspection_id: 103368908,
  details: 'Operator fail to properly wash surfaces in rooms',
  severity: 'M - Minor',
  action: 'Notice to Comply',
  court_outcome: '',
  amount_fined: 0)

# Third Inspection

Inspection.create(
  id: 103442600,
  establishment_id: 10380313,
  date: '2015-03-10',
  status: 'Conditional Pass')

Infraction.create(
  inspection_id: 103442600,
  details: 'Operator fail to properly maintain mechanical washer',
  severity: 'S - Significant',
  action: 'Notice to Comply',
  court_outcome: '',
  amount_fined: 0)

Infraction.create(
  inspection_id: 103442600,
  details: 'Operator fail to properly maintain rooms',
  severity: 'M - Minor',
  action: 'Notice to Comply',
  court_outcome: '',
  amount_fined: 0)

Infraction.create(
  inspection_id: 103442600,
  details: 'Operator fail to properly wash equipment',
  severity: 'M - Minor',
  action: 'Notice to Comply',
  court_outcome: '',
  amount_fined: 0)

Infraction.create(
  inspection_id: 103442600,
  details: 'Operator fail to provide proper equipment',
  severity: 'M - Minor',
  action: 'Notice to Comply',
  court_outcome: '',
  amount_fined: 0)