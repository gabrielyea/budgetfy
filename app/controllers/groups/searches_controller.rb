class Groups::SearchesController < ApplicationController
  def index
    @groups = if params['show_all']
                Group.all.sortify params['sort']
              else
                Group.search(params[:search_this])
              end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(:groupListing, partial: 'groups/listing')
      end
    end
  end
end
