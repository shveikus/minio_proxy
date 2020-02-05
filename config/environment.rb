# frozen_string_literal: true

require 'bundler/setup'
require 'dotenv'

Dotenv.load
ENV['SINATRA_ENV'] ||= 'development'
Bundler.require(:default, ENV['SINATRA_ENV'])
puts ENV['ENDPOINT']
require './lib/app'
require './lib/storage/minio_connector'
require './lib/storage/jira_source'
require './lib/storage/confluence_source'
