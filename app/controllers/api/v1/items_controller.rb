class Api::V1::ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render json: Item.all
  end

  def show
    begin
      item = Item.find(params[:id])
      render json: item
    rescue
      render json: { status: "item not found" }
    end
  end

  def create
    item = Item.new(name: params[:name],
                    description: params[:description],
                    image_url: params[:image_url])
    if item.save
      render json: item
    else
      render json: { status: "invalid submission" }
    end
  end

  def destroy
    begin
      item = Item.find(params[:id])
      item.destroy
      render json: { status: "item deleted" }
    rescue
      render json: { status: "invalid submission" }
    end
  end

end
