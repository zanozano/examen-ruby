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
    photo: ActionController::Base.helpers.asset_path('aircon.png')
  )
end

10.times do |i|
  Equipment.create!(
    equipment_type: 'Calentador',
    name: "CAL-#{i + 1}",
    description: Faker::Lorem.sentence,
    photo: ActionController::Base.helpers.asset_path('heater.png')
  )
end

equipment_ids = Equipment.pluck(:id)

10.times do
  maintainer = Maintainer.create!(
    equipment_type: 'Pendiente',
    support_type: 'Pendiente',
    name: 'Pendiente',
    city: 'Pendiente',
    material: 'Pendiente',
    equipment_id: equipment_ids.sample
  )
end
