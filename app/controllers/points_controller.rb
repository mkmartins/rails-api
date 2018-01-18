# app/controllers/items_controller.rb
class PointsController < ApplicationController
  before_action :set_item
  before_action :set_item_points, only: [:show, :update, :destroy]

  # GET /items/:point_id/points
  def index
    json_response(@item.points)
  end

  # GET /items/:point_id/points/:id
  def show
    json_response(@point)
  end

  # POST /items/:point_id/points
  def create
    @item.points.create!(point_params)
    json_response(@item, :created)
  end

  # PUT /items/:point_id/points/:id
  def update
    @point.update(item_params)
    head :no_content
  end

  # DELETE /items/:point_id/points/:id
  def destroy
    @point.destroy
    head :no_content
  end

  private

  def point_params
    params.permit(:title, :done)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def set_item_points
    @point = @item.points.find_by!(id: params[:id]) if @item
  end
end