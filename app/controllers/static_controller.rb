class StaticController < ApplicationController
  def home
    render json: { status: "It's woking" }
  end
end