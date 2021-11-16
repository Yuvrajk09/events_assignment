class EventDetailsController < ApplicationController
  before_action :set_event_detail, only: %i[show edit update destroy]

  # GET /event_details
  def index
    @q = EventDetail.ransack(params[:q])
    @event_details = @q.result(distinct: true).includes(:users,
                                                        :comments_details, :attendees, :host_details).page(params[:page]).per(10)
  end

  # GET /event_details/1
  def show
    @host_detail = HostDetail.new
    @attendee = Attendee.new
    @comments_detail = CommentsDetail.new
  end

  # GET /event_details/new
  def new
    @event_detail = EventDetail.new
  end

  # GET /event_details/1/edit
  def edit; end

  # POST /event_details
  def create
    @event_detail = EventDetail.new(event_detail_params)

    if @event_detail.save
      message = "EventDetail was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @event_detail, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /event_details/1
  def update
    if @event_detail.update(event_detail_params)
      redirect_to @event_detail,
                  notice: "Event detail was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /event_details/1
  def destroy
    @event_detail.destroy
    message = "EventDetail was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to event_details_url, notice: message
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event_detail
    @event_detail = EventDetail.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def event_detail_params
    params.require(:event_detail).permit(:event_id, :event_name,
                                         :event_startdate, :event_start_time, :event_details, :event_end_date, :event_end_time, :event_location)
  end
end
