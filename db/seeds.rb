# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Client.destroy_all
Stylist.destroy_all
Appointment.destroy_all
cli1 = Client.create({
    name: 'Bub', 
    gender: 'Male',
    age: 26
})
cli2 = Client.create({
    name: 'Barbara', 
    gender: 'Female',
    age: 36
})
cli3 = Client.create({
    name: 'Alex', 
    gender: 'Non-Binary',
    age: 28
})

5.times do 
    Client.create(
        name: Faker::Name.name,
        gender: Faker::Gender.type,
        age: Faker::Number.within(range: 18..80)
    )
end

sty1 = Stylist.create({
    name:"Annie", 
    specialty: "Perms"
})
sty2 = Stylist.create({
    name:"Bobby", 
    specialty: "Braids"
})

appt1 = Appointment.create({
    stylist_id: sty1.id, 
    client_id: cli1.id, 
    time: 2
})
appt2 = Appointment.create({
    stylist_id: sty1.id, 
    client_id: cli2.id, 
    time: 3
})
appt3 = Appointment.create({
    stylist_id: sty2.id, 
    client_id: cli1.id, 
    time: 4
})
appt4 = Appointment.create({
    stylist_id: sty2.id, 
    client_id: cli3.id, 
    time: 5
})

