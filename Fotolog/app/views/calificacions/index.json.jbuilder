json.array!(@calificacions) do |calificacion|
  json.extract! calificacion, :id, :user_id, :foto_id, :puntuacion
  json.url calificacion_url(calificacion, format: :json)
end
