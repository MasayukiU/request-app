class DisapprovalsController < ApplicationController
  before_action :set_disapproval, only: [:new, :create]

  def index
    @disapproval = Disapproval.order('created_at DESC')
  end
  
  def new
  end

  def create
    @disapproval = Disapproval.create(item_id: params[:item_id], user_id: current_user.id)
    if @disapproval.save
      redirect_to item_disapprovals_path
    else
      render :index
    end
  end

  def show
    @disapproval = Disapproval.find(params[:id])
  end


  def destroy
    disapproval = Disapproval.find(params[:id])
    if disapproval.destroy
      redirect_to item_disapprovals_path(disapproval)
    end
  end

  private

  def set_disapproval
    @item = Item.find(params[:item_id])
  end
end
