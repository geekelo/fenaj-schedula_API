class Api::ReservationsController < ApplicationController
  # GET /api/reservations or /api/reservations.json
  def index
    @api_sessions = Api::Session.all
  end

  # GET /api/reservations/1 or /api/reservations/1.json
  def show; end
end
