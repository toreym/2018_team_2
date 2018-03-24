class DonorsController < ApplicationController

  before_action :set_donor, only: [:show, :edit, :update, :destroy]

  def show

  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_donor
      @donor = Donor.find(params[:id])
    end

end
