# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    can :read, :all
    can :search, :all
    can :create,  Comment
    can :read, Comment

    can :create,  Message
    can :read, Message
    
    

    if user.farmer?
      can :create, Product
      can :manage, Product, farmer_id: user.farmer.id
      can :manage, Farmer, id: user.farmer.id

      can :manage, Message, farmer_id: user.farmer.id
      can :manage, Comment do |comment|
        comment.product.farmer.id == user.farmer.id
      end

    end

    if user.admin?
      can :manage, :all

    end
  end
end
