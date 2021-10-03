module ProjectHelperPlugin
 
  def author_project_select_tag(project)
    selected = project.author
    # retrieve the requested parent project
    author_id = (params[:project] && params[:project][:author_id]) || params[:author_id]
    if author_id
      selected = (author_id.blank? ? nil : User.find(author_id))
    end

    options = +''
    options << "<option value=''>&nbsp;</option>" if project.allowed_parents.include?(nil)
    options << project_tree_options_for_select(project.allowed_parents.compact, :selected => selected)
    content_tag('select', options.html_safe, :name => 'project[parent_id]', :id => 'project_parent_id')
  end
 
 
end