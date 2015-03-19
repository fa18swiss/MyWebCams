json.array!(@webcams) do |webcam|
  json.extract! webcam, :id, :name, :url, :latitude, :longitude, :orientation
  json.url webcam_url(webcam, format: :json)
end
