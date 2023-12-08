class Api::V1::ReservationsController < ApplicationController
  before_action :authenticate_token!

   # GET /api/reservations 
  def index
    @api_reservations = Reservation.all

    render json: @api_reservations.map { |reservation| format_reservation(reservation) }
  end

  # GET /api/reservations/1
  def show
    reservation = Reservation.find(params[:id])

    render json: format_reservation(reservation)
  end

  def create
    reservation = Reservation.new(reservation_params)

    if reservation.save
      render json: { message: 'Reservation has been successfully created.' }, status: :ok

      item = Item.find_by(id: reservation_params[:item_id])
      item.update(available: false) if item.present?
    else
      render json: { message: 'ERROR: unable to create reservation.' }, status: :unprocessable_entity
    end
  end

  # DELETE /api/reservations/1 
  def destroy
    reservation = Reservation.find(params[:id])
    if reservation.destroy
      render json: { status: 'success', message: 'Reservation deleted successfully' }
    else
      render json: { status: 'error', message: 'Failed to delete the reservation' }, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:city, :date, :user_id, :item_id)
  end

  def format_reservation(reservation)
    {
      id: reservation.id,
      city: reservation.city,
      date: reservation.date,
      user_id: reservation.user_id,
       item_id: reservation.item_id,
      item: {
        id: reservation.item.id,
        name: reservation.item.name, 
        description: reservation.item.description,
        spa_session_fee: reservation.item.spa_session_fee,
        registration_fee: reservation.item.registration_fee,
        total_amount_payable: reservation.item.total_amount_payable,
        duration: reservation.item.duration,
        image: reservation.item.image.present? ? reservation.item.image : default_image_url
      }
    }
  end
end

