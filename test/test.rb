# frozen_string_literal: true

require File.expand_path '../test/test_helper.rb', __dir__

class MyTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    MinioProxy::ApplicationController
  end

  def test_post_empty_to_jira_return_400
    post '/jira'
    assert_equal 400, last_response.status
  end

  def test_post_empty_to_conf_return_400
    post '/conf'
    assert_equal 400, last_response.status
  end

  def test_post_with_invalid_body_to_jira_return_400
    post '/jira', '{"foo": "bar"}'
    assert_equal 400, last_response.status
  end

  def test_post_with_invalid_body_to_conf_return_400
    post '/conf', '{"foo": "bar"}'
    assert_equal 400, last_response.status
  end

  def test_post_with_valid_body_to_jira_return_200
    post '/jira', '{"webhookEvent": "bar"}'
    assert_equal 200, last_response.status
  end

  def test_post_with_valid_body_to_conf_return_200
    post '/conf', '{"webhookEvent": "bar"}'
    assert_equal 200, last_response.status
  end
end
