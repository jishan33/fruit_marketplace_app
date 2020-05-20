# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
  user ||= User.new
   can :read, :all
   can :search, :all
   
      if user.farmer?
        can :create, Product
        can :manage, Product, farmer_id: user.farmer.id
        can :manage, Farmer, id: user.farmer.id
      end

      if user.admin?  
          can :manage, :all
        
      end
   
  end
end
