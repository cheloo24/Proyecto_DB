json.array!(@coments) do |coment|
  json.extract! coment, :id, :foto_id, :user_id, :fecha_comentario, :texto_comentario, :anonimo
  json.url coment_url(coment, format: :json)
end
