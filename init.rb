Redmine::Plugin.register :redmine_bitbucket_issues do
  name 'Redmine Bitbucket Issues plugin'
  author 'Jose Luiz Tafarel'
  description 'A plugin to import exported Bitbucket JSON issues file.'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://invent.to'

  permission :redmine_bitbucket_issues, { :polls => [:index, :import_issues] }, :public => true
  menu :application_menu, :redmine_bitbucket_issues, { :controller => 'issues_import', :action => 'index' }, :caption => 'Import Issues from Bitbucket'
end
