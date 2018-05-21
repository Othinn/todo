class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]
  before_action :authenticate_user!

  # GET /comments/new
  def new
    @task = Task.find(params[:task_id])
    @comment = @task.comments.new
  end


  # POST /comments
  # POST /comments.json
  def create

    @task = Task.find(params[:task_id])
    @comment = @task.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to project_task_path(@task.project_id ,@task), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @task = Task.find(params[:task_id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to project_task_path(@task.project_id, @task), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:belongs_to, :content, :image)
  end
end
