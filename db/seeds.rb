# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Alicia = User.create(name: 'Alicia', email: "welleralic@gmail.com", password: 'pass')
Sally = Patient.create(name: 'Sally', user_id: Alicia.id)

medication1 = Medication.create(name: 'Singulair', quantity: '1', frequency: '2')

illness1 = Illness.create(illness: 'asthma', medication_id: medication1.id, patient_id: Sally.id)
