# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
get 'upload_issues_files', :to => 'issues_import#index'
post 'import_issues', :to => 'issues_import#import_issues'
