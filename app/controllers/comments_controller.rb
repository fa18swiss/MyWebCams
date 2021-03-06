class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  # POST /comments
  # POST /comments.json
  def create
    return forbidden unless user_signed_in?
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment.webcam, notice: 'Comment was successfully created.' }
      else
        format.html { redirect_to @comment.webcam }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    return forbidden unless user_signed_in?
    webcam = @comment.webcam
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to webcam, notice: 'Comment was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :webcam_id)
    end
end
