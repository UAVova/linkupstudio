class Ability
  include CanCan::Ability

  def initialize(user)
    user = User.new if user.nil?
    can do |action, subject_class, subject|
      user.group.permissions.where(:action => action).any? do |permission|
        permission.subject_class == subject_class.to_s &&
          (subject.nil? || permission.subject_id.nil? || permission.subject_id == subject.id)
      end
    end
  end
end
