class Groups::SearchesController < ApplicationController
  def index
    @groups = if params['show_all']
                Group.includes(:activities).where(user_id: current_user.id).sortify params['sort']
              else
                Group.includes(:activities).where(user_id: current_user.id).search(params[:search_this])
              end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(:groupListing, partial: 'groups/listing')
      end
    end
  end
end
