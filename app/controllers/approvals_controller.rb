class ApprovalsController < ApplicationController
  before_action :set_approval, only: [:new, :create]

  def index
    @approval = Approval.order('created_at DESC')
  end

  def create
    @approval = Approval.create(item_id: params[:item_id], user_id: current_user.id)
    if @approval.save
      redirect_to item_approvals_path
    else
      render :index
    end
  end

  def show
    @approval = Approval.find(params[:id])
  end

  def destroy
    approval = Approval.find(params[:id])
    if approval.destroy
    redirect_to item_approvals_path(approval)
    end
  end

  private

  def set_approval
    @item = Item.find(params[:item_id])
  end
end
