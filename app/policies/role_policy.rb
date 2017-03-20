class RolePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(owner_id: @user.id)
    end
  end
  
  permit [:read, :create, :update, :destroy]
end