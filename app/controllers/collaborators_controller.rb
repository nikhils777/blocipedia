class CollaboratorsController < ApplicationController
  
  def create
    @wiki = Wiki.friendly.find(params[:wiki_id])
    params[:user_ids].flatten.each do |user|
     @wiki.collaborators.build(user_id: user.to_i ).save
    end
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