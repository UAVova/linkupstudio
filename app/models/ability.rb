class Ability
  include CanCan::Ability
  @current_user = nil

  def initialize(user)
    @current_user = user || User.new
    if @current_user.role && (respond_to? @current_user.role)
      self.send(@current_user.role)
    else
      can :see, :tasks
    end
  end

  def admin
    can :manage, :all
  end

  def user
    can [:read, :edit], Task do |task|
      task.state == 2 || task.user_id = @current_user.id
    end
    can :see, :tasks
    can :create, Comment do |comment|
     comment.user_id @current_user.id || comment.task.user.id == @current_user.id
    end
  end

end