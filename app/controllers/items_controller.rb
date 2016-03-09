class ItemsController < ApplicationController
  before_action :bucket

  def index
    @items = @bucket.items 
  end #index

  def show
    @item = Item.find(params[:bucket_id])
  end #show

  def edit
    @item = Item.find(params[:id])
  end #edit

  def new
    @item = Item.new
  end #new

  def create
    @bucket.items.create(item_params)
    redirect_to bucket_items_path(@bucket)
  end #create

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to current_user_bucket_path
    else
      render :edit
    end #update if
  end #update

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to bucket_items_path(@bucket)
  end

  private
    def item_params
      params.require(:item).permit(:name)
    end #item_params

    def bucket
      @bucket = Bucket.find(params[:bucket_id])
    end
end #class
