class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, User
    return unless user.present?

    can :manage, Group, user: { id: user.id }
    can :manage, Activity, author: { id: user.id }
  end
end
