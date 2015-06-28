class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role && (respond_to? user.role)
      self.send(user.role)
    else
      can :see, :tasks
    end
  end

  def admin
    can :manage, :all
  end

  def user
    can :read, Task, state: 2
  end

end