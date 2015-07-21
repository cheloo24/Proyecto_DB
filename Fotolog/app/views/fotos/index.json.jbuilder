json.array!(@fotos) do |foto|
  json.extract! foto, :id, :user_id, :fecha_foto, :descripcion, :n_comentarios
  json.url foto_url(foto, format: :json)
end
