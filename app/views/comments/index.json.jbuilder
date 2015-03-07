json.array!(@comments) do |comment|
  json.extract! comment, :id, :content, :idUser, :idWebCam, :user_id
  json.url comment_url(comment, format: :json)
end
