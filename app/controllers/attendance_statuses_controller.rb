class AttendanceStatusesController < ApplicationController
  before_action :set_attendance_status, only: [:show, :edit, :update, :destroy]

  # GET /attendance_statuses
  def index
    @attendance_statuses = AttendanceStatus.page(params[:page]).per(10)
  end

  # GET /attendance_statuses/1
  def show
  end

  # GET /attendance_statuses/new
  def new
    @attendance_status = AttendanceStatus.new
  end

  # GET /attendance_statuses/1/edit
  def edit
  end

  # POST /attendance_statuses
  def create
    @attendance_status = AttendanceStatus.new(attendance_status_params)

    if @attendance_status.save
      redirect_to @attendance_status, notice: 'Attendance status was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /attendance_statuses/1
  def update
    if @attendance_status.update(attendance_status_params)
      redirect_to @attendance_status, notice: 'Attendance status was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /attendance_statuses/1
  def destroy
    @attendance_status.destroy
    redirect_to attendance_statuses_url, notice: 'Attendance status was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attendance_status
      @attendance_status = AttendanceStatus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attendance_status_params
      params.require(:attendance_status).permit(:attendance_id, :status)
    end
end
