class SubsController < ApplicationController
  before_action :set_sub, only: [:show, :edit, :destroy, :update] 

  def index
    @subs = Sub.all
  end

  def show
 
  end

  def new
    @sub = Sub.new
    #instead of just going to the new.erb.html render the partial form 
    render partial: "form"
  end

  def edit
    render partial: 'form'
  end

  def update
    if @sub.update(subs_params)
      redirect_to @sub
    else 
      render :edit
    end 
  end 

  def destroy
    @sub.destroy
    redirect_to subs_path
  end 

  def create
    @sub = Sub.new(subs_params)
    if @sub.save
      redirect_to subs_path
      # could also put redirect_to root_path
    else 
      render :new
    end
  end 

  private

  def subs_params
    params.require(:sub).permit(:name)
  end 
  def set_sub
    @sub = Sub.find(params[:id])
  end 
end
