module ProjectAuthorsPlugin
  class ProjectAuthorsHookListener < Redmine::Hook::ViewListener

    render_on :view_projects_form, partial: "projects/drop_down_authors"

  end
end