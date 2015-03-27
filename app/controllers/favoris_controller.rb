class FavorisController < ApplicationController

  def toggle
    @error = false
    @count = nil
    @favorite = nil
    id_user = params[:id_user]
    id_webcam = params[:id_webcam]
    @error = validate(id_user, id_webcam)
    if not @error
      f = Favori.forUserWebcam(id_user, id_webcam)
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
  def ordre
    @error = false
    @move = false
    id_user = params[:id_user]
    id_webcam = params[:id_webcam]
    @error = validate(id_user, id_webcam)
    if not @error
      modeLeft = params[:mode] == "left"
      favorisLeft = nil
      favorisRight = nil
      current = Favori.forUserWebcam(id_user, id_webcam).first
      other = nil

      if modeLeft
        other = Favori.where("user_id = ? and ordre < ?", id_user, current.ordre).order(ordre: :desc).first
      else
        other = Favori.where("user_id = ? and ordre > ?", id_user, current.ordre).order(ordre: :asc).first
      end
      unless other.nil? then
        current.ordre, other.ordre = other.ordre, current.ordre
        current.save
        other.save
        @move = true
      end
    end
  end
  private
  def validate(id_user, id_webcam)
    error = false
    error = true if id_user.to_s.empty?
    error = true if id_webcam.to_s.empty?
    if not error
      u = User.find(id_user)
      w = Webcam.find(id_webcam)
      error = true if u.nil?
      error = true if w.nil?
    end
    return error
  end
end
