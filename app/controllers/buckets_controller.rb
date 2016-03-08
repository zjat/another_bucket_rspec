class BucketsController < ApplicationController

before_action :bucket, only: [:show, :edit, :destroy, :update]

  def index
    @buckets = current_user.buckets
  end

  def show
  end

  def edit
  end

  def update
    if @bucket.update(bucket_params)
      redirect_to bucket_path(@bucket)
    else
      render :edit
    end
  end

  def new
    @bucket = Bucket.new
  end

  def create
    @bucket = current_user.buckets.new(bucket_params)
    if @bucket.save
      redirect_to bucket_path(@bucket)
    else
      render :new
    end
  end

  def destroy
    @bucket.destroy
    redirect_to buckets_path
  end

  private
    def bucket
      @bucket = current_user.buckets.find(params[:id])
    end

    def bucket_params
      params.require(:bucket).permit(:name)
    end

end
