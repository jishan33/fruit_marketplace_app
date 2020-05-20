class UsersController < ApplicationController
  def index
    @users= User.all.sort_by{|i| i.id}
  end
end
