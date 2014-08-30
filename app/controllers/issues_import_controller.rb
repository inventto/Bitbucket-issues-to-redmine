require 'json'
class IssuesImportController < ApplicationController
  unloadable
  def index
  end

  def import_issues
    file = File.read params["/import_issues"][:issues_json].path
    data_hash = JSON.parse file
    @issue_counter = 0
    data_hash["issues"].each do |_issue|
      issue = Issue.where(:remote_id => _issue["id"]).first
      if issue.blank?
        issue = Issue.new
        issue.subject = _issue["title"]
        issue.description = _issue["content"]
        if issue["kind"].eql? 'bug'
          issue.tracker_id = 1
        elsif issue["kind"].eql? 'enhancement'
          issue.tracker_id = 2
        else
          issue.tracker_id = 3
        end
        issue.project_id = params["/import_issues"][:project_id]
        issue.done_ratio = 0
        issue.priority_id = 2
        if _issue["status"].eql? 'new' or _issue["status"].eql? 'on_hold'
          issue.status_id = 7
        elsif _issue["status"].eql? 'open'
          issue.status_id = 2
        elsif _issue["status"].eql? 'resolved'
          issue.status_id = 3
        else
          issue.status_id = 5
        end
        issue.remote_id = _issue["id"]
        issue.author_id = 22
        issue.save!
        @issue_counter += @issue_counter
      end
    end
  end
end
