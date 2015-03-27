class FavorisController < ApplicationController

  def toggle
    @error = false
    @count = nil
    @favorite = nil
    id_user = params[:id_user]
    id_webcam = params[:id_webcam]
    @error = true if id_user.to_s.empty?
    @error = true if id_webcam.to_s.empty?
    if not @error
      u = User.find(id_user)
      w = Webcam.find(id_webcam)
      @error = true if u.nil?
      @error = true if w.nil?
      if not @error
        f = Favori.where("user_id = ? AND webcam_id = ?", id_user, id_webcam)
        if f.count > 0
          f[0].destroy
          @favorite = false
        else
          Favori.new(user_id: id_user, webcam_id: id_webcam).save
          @favorite = true
        end
        @count = Favori.where("webcam_id = ?", id_webcam).count
      end
    end
  end

end
