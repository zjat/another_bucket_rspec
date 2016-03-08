class BucketsController < ApplicationController
  def index
    @buckets = current_user.buckets
  end

  def show
  end

  def edit
  end

  def new
    @bucket = current_user.buckets.new
  end
end
