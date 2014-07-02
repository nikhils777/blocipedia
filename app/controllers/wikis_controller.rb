class WikisController < ApplicationController
  def index
    @wikis = Wiki.all.visible_to
  end

  def new
    @wiki = Wiki.new

    authorize @wiki
  end

  def show
    @wiki = Wiki.friendly.find(params[:id])
    @users = User.where.not(id: current_user.id)
    @collaborator = Collaborator.new  
    if request.path != wiki_path(@wiki)
      redirect_to @wiki, status: :moved_permanently
    end
  end

  def edit
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
  end

  def update
    @wiki = Wiki.friendly.find(params[:id])
    if @wiki.update_attributes( wiki_params )
      redirect_to @wiki
    else
      flash[:error] = "Error updating wiki. Please try again."
      render :edit
    end
  end
  def create
    @wiki = current_user.wikis.build(wiki_params)
    authorize @wiki
    if @wiki.save
      redirect_to root_path, notice: "Wiki was saved successfully."
    else
      flash[:error] = "Error saving wiki. Please try again."
      render :new
    end
  end
  def destroy
    @wiki = Wiki.friendly.find(params[:id])
    authorize @wiki
    @wiki.destroy
    if @wiki.destroy
      redirect_to root_path
    else
      redirect_to root_path, error: "Error destroying wiki please try again"
    end
  end

  private

  def wiki_params
    params.require(:wiki).permit(:name, :description, :public)
  end
end
