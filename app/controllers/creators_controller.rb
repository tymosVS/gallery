class CreatorsController < ApplicationController
  before_action :find_user

  def new
    @creator = Creator.new
  end

  def create
  
    @category = Category.new(category_params)
    @user.creators.create(:user=>@user, :category=>@category)
    if @category.save
      @user.creators.create(:user=>@user)
      redirect_to categories_path
    else
      render :new
    end
    

  end

  private

  def category_params
    params.require(:category).permit(:title, :description)
  end

  def find_user
    @user = User.find(current_user.id)
  end
end
