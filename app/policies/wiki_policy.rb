class WikiPolicy < ApplicationPolicy
  def index?
    true
  end
  def collaborate?
    (record.user == user || user.role?(:admin)) || (@wiki.collaborate.include?(current_user.email) )
  end
end