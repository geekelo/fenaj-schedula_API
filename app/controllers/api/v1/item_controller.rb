class Api::V1::ItemController < ApplicationController
  before_action :authenticate_token!
end
