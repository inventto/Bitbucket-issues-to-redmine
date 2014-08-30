require 'json'
class IssuesImportController < ApplicationController
  unloadable
  def index
  end

  def import_issues
    file = File.read params["/import_issues"][:issues_json].path
    @data_hash = JSON.parse file
  end
end
