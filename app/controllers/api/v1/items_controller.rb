class Api::V1::ItemsController < ApplicationController
  before_action :authenticate_token!, only: [:show]

  def index
  @api_items = Item.all
  default_image_url = 'https://i.pravatar.cc/300?img=10'

  items_with_images = @api_items.map do |item|
    {
      id: item.id,
      name: item.name,
      description: item.description,
      deposit: item.deposit,
      spa_session_fee: item.spa_session_fee,
      registration_fee: item.registration_fee,
      total_amount_payable: item.total_amount_payable,
      duration: item.duration,
      image: item.image.present? ? item.image : default_image_url
    }
  end

  render json: items_with_images, status: :ok
end


  # GET /api/items/1 
   
   def show
    item = Item.find(params[:id])

    render json: {
      id: item.id,
      name: item.name,
      description: item.description,
      deposit: item.deposit,
      spa_session_fee: item.spa_session_fee,
      registration_fee: item.registration_fee,
      total_amount_payable: item.total_amount_payable,
      duration: item.duration,
      image: item.image.present? ? item.image : default_image_url
    }
  end

   def new
    item= Item.new
   end

  def create
    item = Item.new(item_params)

    if item.save
      render json: item, status: :ok
    else
      render json: { message: 'ERROR: Unable to create item' }, status: :unprocessable_entity
    end
  end

  # DELETE /api/reservations/1 
  def destroy
    item = Item.find(params[:id])
    if item.destroy
      render json: { status: 'success', message: 'Item deleted successfully' }
    else
      render json: { status: 'error', message: 'Failed to delete the Item' }, status: :unprocessable_entity
    end
  end
  

  private

  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :image,
      :deposit,
      :spa_session_fee,
      :registration_fee,
      :total_amount_payable,
      :duration,
      :user_id
    )
  end
end
