module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == params[:sort] && params[:direction] == "asc") ? "desc" : "asc"

    # Sets the direction of the icon
    icon = params[:direction] == "asc" ? "glyphicon glyphicon-chevron-up" : "glyphicon glyphicon-chevron-down"
    icon = column == params[:sort] ? icon : ""
    
    link_to "#{title} <span class='#{icon}'></span>".html_safe, :sort => column, :direction => direction
  end
end
