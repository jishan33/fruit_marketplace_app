# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
     can [:index, :show], Product
     can [:create, :edit, :update, :destroy], Product, farmer_id: user.farmer&.id
      if user.admin?  
        can :manage, :all
      end
   
  end
end
