class WikiPolicy < ApplicationPolicy
  def index?
    true
  end
  
  def edit?
    if user
      (record.user == user || user.role?(:admin) || (record.collaborators.where(user_id: user.id).length > 0))
    else 
      false
    end
  end
  
  def update?
    edit?
  end
end