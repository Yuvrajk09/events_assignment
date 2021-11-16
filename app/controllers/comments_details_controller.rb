class CommentsDetailsController < ApplicationController
  before_action :set_comments_detail, only: %i[show edit update destroy]

  def index
    @q = CommentsDetail.ransack(params[:q])
    @comments_details = @q.result(distinct: true).includes(:event_comment,
                                                           :user).page(params[:page]).per(10)
  end

  def show; end

  def new
    @comments_detail = CommentsDetail.new
  end

  def edit; end

  def create
    @comments_detail = CommentsDetail.new(comments_detail_params)

    if @comments_detail.save
      message = "CommentsDetail was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @comments_detail, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @comments_detail.update(comments_detail_params)
      redirect_to @comments_detail,
                  notice: "Comments detail was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @comments_detail.destroy
    message = "CommentsDetail was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to comments_details_url, notice: message
    end
  end

  private

  def set_comments_detail
    @comments_detail = CommentsDetail.find(params[:id])
  end

  def comments_detail_params
    params.require(:comments_detail).permit(:comments, :comment_id)
  end
end
