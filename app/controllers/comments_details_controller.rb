class CommentsDetailsController < ApplicationController
  before_action :set_comments_detail, only: [:show, :edit, :update, :destroy]

  # GET /comments_details
  def index
    @comments_details = CommentsDetail.all
  end

  # GET /comments_details/1
  def show
  end

  # GET /comments_details/new
  def new
    @comments_detail = CommentsDetail.new
  end

  # GET /comments_details/1/edit
  def edit
  end

  # POST /comments_details
  def create
    @comments_detail = CommentsDetail.new(comments_detail_params)

    if @comments_detail.save
      message = 'CommentsDetail was successfully created.'
      if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referrer, notice: message
      else
        redirect_to @comments_detail, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /comments_details/1
  def update
    if @comments_detail.update(comments_detail_params)
      redirect_to @comments_detail, notice: 'Comments detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /comments_details/1
  def destroy
    @comments_detail.destroy
    message = "CommentsDetail was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to comments_details_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comments_detail
      @comments_detail = CommentsDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comments_detail_params
      params.require(:comments_detail).permit(:comments, :comment_id)
    end
end
