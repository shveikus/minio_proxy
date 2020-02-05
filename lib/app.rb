# frozen_string_literal: true

module MinioProxy
  class ApplicationController < Sinatra::Base
    post '/jira' do
      @request_payload = request.body.read
      status Storage::JiraSource.call @request_payload
      status
    end

    post '/conf' do
      @request_payload = request.body.read
      status Storage::ConfluenceSource.call @request_payload
      status
    end
  end
end
