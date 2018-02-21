module Api::V1
  class ItemsController < ApplicationController
    before_action :set_item, only: [:show, :update, :destroy]

    # GET /items
    def index
      @items = Item.order("created_at ASC")
      render json: @items, include: ['points']
    end

    # POST /items
    def create
      @item = Item.create!(item_params)
      render json: @item, include: ['points']
    end

    # GET /items/:id
    def show
      render json: @item, include: ['points']
    end

    # PUT /items/:id
    def update
      @item.update(item_params)
      head :no_content
    end

    # DELETE /items/:id
    def destroy
      @item.destroy
      head :no_content
    end

    private

    def item_params
      # whitelist params
      params.permit(:title, :item, :created_by, points_attributes:[:point_id, :content])
    end

    def set_item
      @item = Item.find(params[:id])
    end
  end
end