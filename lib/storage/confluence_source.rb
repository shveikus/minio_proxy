# frozen_string_literal: true

module MinioProxy
  module Storage
    class ConfluenceSource < MinioConnector
      attr_reader :event, :tool

      def initialize(event, tool)
        @event = event
        @tool = tool
      end

      def self.call(event)
        new(event, 'confluence').call
      end
    end
  end
end
