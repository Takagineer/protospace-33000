class PrototypesController < ApplicationController
  before_action :authenticate_user!(only: [:new, :edit, :destroy])
end

def index
  @prototypes = prototype.all
end

def new
  @prototype = Prototype.new
end

def create
  Prototype.create(prototype_params)
  if Prototype.save
      redirect_to "root_path"
  else
    render :new_prototype_path
  end
end

def show
  @prototype = Prototype.find(params[:id])
  @comment = Comemnt.new
end

def edit
  @prototype = Prototype.find(params[:id])
  unless user_signed_in?
    redirect_to action: :index
  end
end

def update
  if prototype.update(prototype_params)
    redirect_to root_path
  else
    render :edit_prptotype_path
  end
end

def destroy
  prototype = Prototype.find(params[:id])
  prototype.destory
end
private

def prototype_params
  params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
end