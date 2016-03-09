class ItemsController < ApplicationController


  def index
    @items = Item.all
  end #index

  def show
    @item = Item.find(params[:id])
  end #show

  def edit
    @item = Item.find(params[:id])
  end #edit

  def new
    @item = Item.new
    binding.pry
  end #new

  def create
    binding.pry
    @item =
    if @item.save
      redirect_to bucket_path
    else
      render :new
    end #create/if
  end #create

  def update
    @item = Item.find(params[:id])

    if @item.update(item_params)
      redirect_to current_user_bucket_path
    else
      render :edit
    end #update if
  end #update

  private
    def item_params
      params.require(:item).permit(:name)
    end #item_params
end #class
