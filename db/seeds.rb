# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Alicia = User.create(name: 'Alicia', email: 'welleralic@gmail.com', password: 'pass')
Sally = Patient.create(name: 'Sally', user_id: Alicia.id)
medication1 = Medication.create(name: 'Singulair', quantity: '1', frequency: '2')
category1 = Category.create(title: 'Respiratory')
category2 = Category.create(title: 'Gastro')
category3 = Category.create(title: 'Skeletal')
category4 = Category.create(title: 'Immunology')
category5 = Category.create(title: 'Mental')
illness1 = Illness.create(illness: 'asthma', medication_id: medication1.id, patient_id: Sally.id, category_id: category1.id)
Medication.create(name: 'Singulair')
Medication.create(name: 'Synthroid')
Medication.create(name: 'Albuterol')
Medication.create(name: 'Azelastine')
Medication.create(name: 'Pantoprazole')

# User.create(email: 'welleralic@gmail.com')

Illness.create(illness: 'Hyperthroidism')
Illness.create(illness: 'Hypertension')
Illness.create(illness: 'allergies')
Illness.create(illness: 'asthma')
