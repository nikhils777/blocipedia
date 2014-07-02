class WikiPolicy < ApplicationPolicy
  def index?
    true
  end
  
  def edit?
    user &&
    (record.user == user || user.role?(:admin) || (record.collaborators.where(user_id: current_user.id).length > 0))
  end
  
  def update?
    edit?
  end
end