class Customer::UsersController < ApplicationController
  def show
  end
  
  def set_user
    @user = User.find([:id])
  end
  
  def mypage
    
  end
  
end
