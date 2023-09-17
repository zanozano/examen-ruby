require 'faker'

User.create!(
  email: 'admin@fullclima.com',
  password: 'admin123456',
  admin: 'admin'
)

User.create!(
  email: 'operador@fullclima.com',
  password: 'operador123456',
  admin: 'operador'
)

10.times do |i|
  Equipment.create!(
    equipment_type: 'Aire acondicionado',
    name: "AIR-#{i + 1}",
    description: Faker::Lorem.sentence,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'aircon.png'))
  )
end

10.times do |i|
  Equipment.create!(
    equipment_type: 'Calentador',
    name: "CAL-#{i + 1}",
    description: Faker::Lorem.sentence,
    photo: File.open(Rails.root.join('app', 'assets', 'images', 'heater.png'))
  )
end

equipment_ids = Equipment.pluck(:id)

10.times do
  equipment_id = equipment_ids.sample
  puts "Creating Maintainer with Equipment ID: #{equipment_id}"
  maintainer = Maintainer.create!(
    equipment_type: 'Pending',
    support_type: 'Pending',
    name: 'Pending',
    city: 'Pending',
    material: 'Pending',
    equipment_id: equipment_id
  )
end

