class AppointmentsController < ApplicationController
  def show
    @appointment = Appointment.find(params[:id])
  end
  #def index
  #  @appointments = Appointment.all
  #end
  def new
    @appointment = Appointment.new
  end

  def create
  #  puts params
    @appointment = Appointment.create(appointment_params)
    if @appointment.save
      redirect_to @appointment
    else
      render :new
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:appointment_datetime, :patient_id, :doctor_id )
  end
end
