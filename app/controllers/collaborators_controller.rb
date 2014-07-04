class CollaboratorsController < ApplicationController
  
  def create
    @wiki = Wiki.friendly.find(params[:wiki_id])
    id = params[:user_id]
    @wiki.collaborators.build(user_id: id ).save
    
    redirect_to @wiki
  end

  
  def destroy
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @collaborator = Collaborator.find(params[:id])
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