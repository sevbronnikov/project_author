Redmine::Plugin.register :project_authors do
  name 'Project Authors plugin'
  author 'SeVBronnikov'
  description 'This is a project authors plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  require_dependency 'project_authors_hook_listener'

  Dir[Rails.root.join('plugins', 'project_authors', 'patch', '*.rb')].each { |f| require f }
  Project.include ProjectAuthorsPlugin::ProjectPatch
  ProjectsHelper.include ProjectsHelperPlugin::ProjectsHelperPatch


end
