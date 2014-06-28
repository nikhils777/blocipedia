class CollaboratorsController < ApplicationController
  
  def index
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.first
  end
  def show
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.first

  end
  def new
    @wiki = Wiki.friendly.find(params[:wiki_id])
    @collaborator = Collaborator.new
    @users = User.all
  end
  def create
    @wiki = Wiki.friendly.find(params[:wiki_id])
    params[:user_ids].flatten.each do |user|
     @wiki.collaborators.build(user_id: user.to_i ).save
    end
    redirect_to @wiki
  end
  def edit
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = @wiki.collaborators.first
    @@user_collaborators
  end

  def update
    @@user_collaborators << params[:user_ids].flatten
    if @@user_collaborators.length != 0
      flash[:success] = "collaborators added"
      redirect_to root_path
    else
      flash[:error] = "not saved"
      redirect_to root_path
    end
    # @wiki = Wiki.find(params[:wiki_id])
    # @collaborator = @wiki.collaborators.find(params[:collaborator_id])
    # @collaborator.create_collaborators
    # @collaborator.add_user(params[:user_ids])
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