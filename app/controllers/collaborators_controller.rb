class CollaboratorsController < ApplicationController
  
  def create
    @wiki = Wiki.friendly.find(params[:wiki_id])
    id = params[:user_id]
    @collaborator = @wiki.collaborators.new(user_id: id )
    authorize @collaborator
    if @collaborator.save
      redirect_to @wiki
    else
     flash[:error] = "error adding collaborator"
    redirect_to [@wiki]
    end 
  end

  
  def destroy
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
    authorize @collaborator
    if @collaborator.destroy
      flash[:success] = "collaborator removed"
      redirect_to [@wiki]
    else
      flash[:error] = "error removing collaborator"
      redirect_to [@wiki]
    end
  end

  private

  def collaborator_params
    params.require(:collaborator)
  end
  
end