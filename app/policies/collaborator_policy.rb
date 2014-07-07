class CollaboratorPolicy < ApplicationPolicy
  def create?
    destroy?
  end
  def destroy?
    true
  end
end