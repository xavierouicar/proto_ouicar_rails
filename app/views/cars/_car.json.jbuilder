json.extract! car, :id, :registration, :user_id, :model, :brand, :created_at, :updated_at
json.url car_url(car, format: :json)