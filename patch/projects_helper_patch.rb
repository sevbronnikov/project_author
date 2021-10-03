module ProjectsHelperPlugin
  module ProjectsHelperPatch

    def author_project_select_tag(project)
      selected = project.author
      # retrieve the requested parent project
      author_id = (params[:project] && params[:project][:author_id]) || params[:author_id]
      if author_id
        selected = (author_id.blank? ? nil : [User.find(author_id).name, User.find(author_id).id])
      end

      options = +''
      options << "<option value=''>&nbsp;</option>" # if project.allowed_authors.include?(nil)
      options << options_for_select(User.all.map{|u| [u.name, u.id]}, selected)
      content_tag('select', options.html_safe, :name => 'project[author_id]', :id => 'project_author_id')
    end

  end
end