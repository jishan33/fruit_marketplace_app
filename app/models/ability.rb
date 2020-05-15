# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
     can [:index, :show], Product
     
     if user.user_type == "farmer"
      can [:create], Product
      can [:edit, :update, :destroy], Product, farmer_id: user.farmer
     end
    if user.admin?  
      can :manage, :all
    end
  end
end
