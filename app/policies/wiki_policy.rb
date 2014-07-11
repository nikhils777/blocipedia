class WikiPolicy < ApplicationPolicy
  def index?
    true
  end
  
  def edit?
    
    user && (record.user == user || user.role?(:admin) || (record.collaborators.where(user_id: user.id).length > 0))
    
  end
  
  def update?
    edit?
  end
  def destroy?
    user && (record.user == user || user.role?(:admin))
  end
  def show?
    record.public || (user && user.subscriptions) 
  end
end