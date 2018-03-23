class FundingNeedsController < ApplicationController

  before_action :set_donor, only: [:show, :edit, :update, :destroy]

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

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_donor
      @donor = Donor.find(params[:id])
    end

end
