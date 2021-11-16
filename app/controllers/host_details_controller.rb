class HostDetailsController < ApplicationController
  before_action :set_host_detail, only: [:show, :edit, :update, :destroy]

  # GET /host_details
  def index
    @host_details = HostDetail.all
  end

  # GET /host_details/1
  def show
  end

  # GET /host_details/new
  def new
    @host_detail = HostDetail.new
  end

  # GET /host_details/1/edit
  def edit
  end

  # POST /host_details
  def create
    @host_detail = HostDetail.new(host_detail_params)

    if @host_detail.save
      redirect_to @host_detail, notice: 'Host detail was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /host_details/1
  def update
    if @host_detail.update(host_detail_params)
      redirect_to @host_detail, notice: 'Host detail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /host_details/1
  def destroy
    @host_detail.destroy
    message = "HostDetail was successfully deleted."
    if Rails.application.routes.recognize_path(request.referrer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referrer, notice: message
    else
      redirect_to host_details_url, notice: message
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_host_detail
      @host_detail = HostDetail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def host_detail_params
      params.require(:host_detail).permit(:host_id, :host_name)
    end
end
