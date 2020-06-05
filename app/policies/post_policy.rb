class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create? 
    # any logged in user can create
    !user.nil?
  end

  def update?
    record.user == user
  end

  def destroy?
    # same as update, ie user can destroy
    update?
  end
end
