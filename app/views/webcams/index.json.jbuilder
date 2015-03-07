json.array!(@webcams) do |webcam|
  json.extract! webcam, :id, :nom, :url, :latitude, :longitude, :orientation, :idUser, :user_id
  json.url webcam_url(webcam, format: :json)
end
