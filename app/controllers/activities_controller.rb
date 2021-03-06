class ActivitiesController < ApplicationController
  before_action :set_activity, only: %i[show edit update destroy]
  load_and_authorize_resource :user
  load_and_authorize_resource through: :user

  # GET /activities or /activities.json
  def index
    @group = Group.find(params['group_id'])
    @activities = @group.activities
  end

  # GET /activities/1 or /activities/1.json
  def show; end

  # GET /activities/new
  def new
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit; end

  # POST /activities or /activities.json
  def create
    return redirect_to new_user_group_activity_path, alert: 'Select a category' if params['groups'].nil?

    @activity = Activity.new(activity_params)

    params['groups'].each do |id|
      @activity.groups << Group.find(id)
    end

    respond_to do |format|
      if @activity.save
        format.html { redirect_to user_group_activities_path, notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to user_group_activities_path, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_activity
    @activity = Activity.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def activity_params
    params.require(:activity).permit(:name, :amount).merge(author_id: params['user_id'])
  end
end
