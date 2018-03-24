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
    search = params[:search]
    @funding_needs = FundingNeed.where(:approved => true).where("end_date >= ?", Date.today).order(end_date: :asc)

    respond_to do |format|
      format.json { render json: @funding_needs }
    end
  end

end
