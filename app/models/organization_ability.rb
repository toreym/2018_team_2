class OrganizationAbility
  include CanCan::Ability

  def initialize(org)

    can :manage, Organization, :id => org.id

    can [:new, :create, :read], FundingNeed, :organization_id => org.id

  end
end
