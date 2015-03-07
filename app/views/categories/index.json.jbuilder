json.array!(@categories) do |category|
  json.extract! category, :id, :nom, :idWebCam, :webcam_id
  json.url category_url(category, format: :json)
end
