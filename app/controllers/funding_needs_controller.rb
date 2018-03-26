class FundingNeedsController < ApplicationController

  def show
    @recommendations = []
    @field_of_interests = []
    interests = Interest.all
    donor_interests = @donor.field_of_interests
    interests.each do |interest|

      @field_of_interests.push(
          {
              :id => interest.id,
              :name => interest.name,
              :category => interest.category,
              :subcategory => interest.subcategory,
              :liked => donor_interests.where(:interest_id => interest.id).liked
          }
      )
    end


  end

  def get_funding_needs
    #TODO: do group by id and select count(*), weight by count(*) on matched_needs
    donor_interests = current_donor.field_of_interests.where(:liked => true).map{|interest| interest.interest_id}
    ids = if params[:search].present?
            FundingNeed.joins('left join organizations on organizations.id = funding_needs.organization_id').where("organizations.name like ?", "%#{params[:search]}%").where(:approved => true).where("end_date >= ?", Date.today).order(end_date: :asc).distinct.map{|need| need.id}
          else
            FundingNeed.joins('join funding_needs_interests on funding_needs.id = funding_needs_interests.funding_need_id').where(:funding_needs_interests => {:interest_id => donor_interests}).where(:approved => true).where("end_date >= ?", Date.today).order(end_date: :asc).distinct.map{|need| need.id}
          end
    matched_needs = FundingNeed.where(:id => ids)
    low_prio_needs = FundingNeed.where(:approved => true).where("end_date >= ?", Date.today).where.not(:id => matched_needs.ids).order(end_date: :asc)

    @funding_needs = params[:search].present? ? matched_needs : matched_needs+low_prio_needs
    respond_to do |format|
      format.html {render partial: 'layouts/card'}
    end
  end

end
