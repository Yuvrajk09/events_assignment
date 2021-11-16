class HostDetailsController < ApplicationController
  before_action :set_host_detail, only: %i[show edit update destroy]

  def index
    @q = HostDetail.ransack(params[:q])
    @host_details = @q.result(distinct: true).includes(:host).page(params[:page]).per(10)
  end

  def show; end

  def new
    @host_detail = HostDetail.new
  end

  def edit; end

  def create
    @host_detail = HostDetail.new(host_detail_params)

    if @host_detail.save
      message = "HostDetail was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @host_detail, notice: message
      end
    else
      render :new
    end
  end

  def update
    if @host_detail.update(host_detail_params)
      redirect_to @host_detail, notice: "Host detail was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @host_detail.destroy
    message = "HostDetail was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to host_details_url, notice: message
    end
  end

  private

  def set_host_detail
    @host_detail = HostDetail.find(params[:id])
  end

  def host_detail_params
    params.require(:host_detail).permit(:host_id, :host_name)
  end
end
