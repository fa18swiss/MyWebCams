json.array!(@favoris) do |favori|
  json.extract! favori, :id, :ordre, :idUser, :idWebCam, :user_id, :webcam_id
  json.url favori_url(favori, format: :json)
end
