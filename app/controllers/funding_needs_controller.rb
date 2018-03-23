class FundingNeedsController < ApplicationController
  before_action :set_funding_need, only: [:show, :edit, :update, :destroy]

  # GET /funding_needs
  # GET /funding_needs.json
  def index
    @funding_needs = FundingNeed.all
  end

  # GET /funding_needs/1
  # GET /funding_needs/1.json
  def show
  end

  # GET /funding_needs/new
  def new
    @funding_need = FundingNeed.new
  end

  # GET /funding_needs/1/edit
  def edit
  end

  # POST /funding_needs
  # POST /funding_needs.json
  def create
    @funding_need = FundingNeed.new(funding_need_params)

    respond_to do |format|
      if @funding_need.save
        format.html { redirect_to @funding_need, notice: 'Funding need was successfully created.' }
        format.json { render :show, status: :created, location: @funding_need }
      else
        format.html { render :new }
        format.json { render json: @funding_need.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funding_needs/1
  # PATCH/PUT /funding_needs/1.json
  def update
    respond_to do |format|
      if @funding_need.update(funding_need_params)
        format.html { redirect_to @funding_need, notice: 'Funding need was successfully updated.' }
        format.json { render :show, status: :ok, location: @funding_need }
      else
        format.html { render :edit }
        format.json { render json: @funding_need.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funding_needs/1
  # DELETE /funding_needs/1.json
  def destroy
    @funding_need.destroy
    respond_to do |format|
      format.html { redirect_to funding_needs_url, notice: 'Funding need was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funding_need
      @funding_need = FundingNeed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funding_need_params
      params.fetch(:funding_need, {})
    end
end
