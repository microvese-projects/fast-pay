class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: %i[show destroy]

  # GET /groups or /groups.json
  def index
    @groups = Group.all.where(user_id: params[:user_id]).includes(:dealings)
  end

  # GET /groups/1 or /groups/1.json
  def show
    @group = Group.includes(:dealings).find(params[:id])

    @dealings = if @group
                  @group.dealings.order(created_at: :desc)
                else
                  []
                end
  end

  # GET /groups/new
  def new
    @group = Group.new
  end

  # POST /groups or /groups.json
  def create
    @groups = Group.where(user_id: params[:user_id]).includes(:dealings)
    @group = Group.new(group_params)

    Group.transaction do
      if @groups.any? { |group| group.name == @group.name }
        redirect_to user_groups_path(current_user), alert: 'Group already exists!'
      else
        @group.user_id = params[:user_id]

        respond_to do |format|
          if @group.save
            format.html { redirect_to user_groups_path(current_user), notice: 'Group was successfully created.' }
            format.json { render :show, status: :created, location: @group }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @group.errors, status: :unprocessable_entity }
          end
        end
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    @group.destroy

    respond_to do |format|
      format.html { redirect_to user_groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
