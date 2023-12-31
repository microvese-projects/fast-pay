class DealingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_dealing, only: %i[destroy]

  # GET /dealings/new
  def new
    @dealing = Dealing.new
  end

  # POST /dealings or /dealings.json
  def create
    @dealing = Dealing.new(dealing_params)
    @dealing.author = current_user

    respond_to do |format|
      if @dealing.save
        group = Group.find(params[:group_id])
        group.dealings << @dealing

        format.html do
          redirect_to user_group_path(current_user, params[:group_id]), notice: 'Dealing was successfully created.'
        end
        format.json { render :show, status: :created, location: @dealing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dealing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dealings/1 or /dealings/1.json
  def destroy
    @dealing.destroy

    respond_to do |format|
      format.html { redirect_to user_group_path, notice: 'Dealing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_dealing
    @dealing = Dealing.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def dealing_params
    params.require(:dealing).permit(:name, :amount)
  end
end
