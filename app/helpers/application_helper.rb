module ApplicationHelper
  def current_controller?(names)
    p names.include?(params[:controller]) unless params[:controller].blank?
  end
end
