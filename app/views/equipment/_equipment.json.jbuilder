json.extract! equipment, :id, :equipment_type, :name, :description, :photo, :created_at, :updated_at
json.url equipment_url(equipment, format: :json)
