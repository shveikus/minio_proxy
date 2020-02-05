# frozen_string_literal: true

module MinioProxy
  module Storage
    class JiraSource < MinioConnector
      attr_reader :event, :tool

      def initialize(event, tool)
        @event = event
        @tool = tool
      end

      def self.call(event)
        new(event, 'jira').call
      end
    end
  end
end
