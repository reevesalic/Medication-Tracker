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
# Medication.create(name: 'Synthroid')
# Medication.create(name: 'Albuterol')
# Medication.create(name: 'Azelastine')
# Medication.create(name: 'Pantoprazole')

category1 = Category.create(title: 'Respiratory')
# Category.create(category: 'Pulmonary')
# Category.create(category: 'Gastro')

illness1 = Illness.create(illness: 'asthma', medication_id: medication1.id, patient_id: Sally.id, category_id: category1.id)
# Illness.create(illness: 'Hypertension')
# Illness.create(illness: 'allergies')
# Illness.create(illness: 'asthma')
# Illness.create(illness: 'acid reflux')

