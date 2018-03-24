class OrganizationAbility
  include CanCan::Ability

  def initialize(org_user)

    can [:update, :read], Organization, :organization_user_id => org_user.id

    can :manage, OrganizationUser, :id => org_user.id

    can [:new, :create, :read, :destroy], FundingNeed, :organization_id => org_user.organizations.ids.append(nil)

  end
end
