# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
     can [:index, :show, :new, :create], Product
     can [:edit, :update, :destroy], Product, farmer_id: user.farmer&.id
      if user.admin?  # additional permissions for administrators
        can :manage, :all
      end
   
  end
end
