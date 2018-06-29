class LedgersController < ApplicationController
  before_action :check_login

  def create
    stock = Stock.find(params[:assets])
    current_user.invest(stock)
    redirect_to stock
  end

  def destroy
    stock = Ledger.find(params[:id]).stock
    current_user.divest(stock)
    redirect_to stock
  end

  private

  def check_login
    unless logged_in?
      flash[:danger] = "You have to log in"
      redirect_to login_path
    end
  end
end
