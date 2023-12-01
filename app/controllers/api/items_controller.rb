class Api::ItemsController < ApplicationController
  before_action :set_api_session, only: %i[show edit update destroy]

  # GET /api/items or /api/items.json
  def index
    @api_items = Api::Item.all
    render json: {
      name:,
      description:,
      deposit:,
      spa_session_fee:,
      registration_fee:,
      total_amount_payable:,
      duration:,
      user:
    }
  end

  # GET /api/items/1 or /api/items/1.json
  def show
    render json: {
      name:,
      description:,
      deposit:,
      spa_session_fee:,
      registration_fee:,
      total_amount_payable:,
      duration:,
      user:
    }
  end

  # def create
  #   session = Session.new(session_params)

  #   if session.save
  #     render json: session, status: :ok
  #   else
  #     render json: { message: 'ERROR: Unable to create session' }, status: :unprocessable_entity
  #   end
  # end

  private

  def session_params
    params.require(:session).permit(
      :name,
      :description,
      :deposit,
      :spa_session_fee,
      :registration_fee,
      :total_amount_payable,
      :duration,
      :user_id
    )
  end
end
