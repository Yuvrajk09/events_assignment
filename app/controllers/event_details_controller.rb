class EventDetailsController < ApplicationController
  before_action :set_event_detail, only: %i[show edit update destroy]

  def index
    @q = EventDetail.ransack(params[:q])
    @event_details = @q.result(distinct: true).includes(:users,
                                                        :comments_details, :attendees, :host_details).page(params[:page]).per(10)
  end

  def show
    @host_detail = HostDetail.new
    @attendee = Attendee.new
    @comments_detail = CommentsDetail.new
  end

  def new
    @event_detail = EventDetail.new
  end

  def edit; end

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

  def update
    if @event_detail.update(event_detail_params)
      redirect_to @event_detail,
                  notice: "Event detail was successfully updated."
    else
      render :edit
    end
  end

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

  def set_event_detail
    @event_detail = EventDetail.find(params[:id])
  end

  def event_detail_params
    params.require(:event_detail).permit(:event_id, :event_name,
                                         :event_startdate, :event_start_time, :event_details, :event_end_date, :event_end_time, :event_location)
  end
end
