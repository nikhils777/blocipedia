class CollaboratorPolicy < ApplicationPolicy
  def destroy?
    user.present? && (user.id == record.wiki.user_id)
  end
  def create?
    destroy?
  end

end