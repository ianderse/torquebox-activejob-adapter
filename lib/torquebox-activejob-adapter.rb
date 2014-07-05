require 'torquebox/messaging'
require_relative 'torquebox/active_job_processor'

module ActiveJob
  module QueueAdapters
    class TorqueboxAdapter
      DEFAULT_QUEUE = '/queues/active_job'

      class << self
        def enqueue(job, *args)
          queue.publish([job, *args])
        end

        def enqueue_at(job, timestamp, *args)
          time = Time.at(timestamp)
          Rails.logger.debug("ENQUEUE_AT: #{time}")
          queue.publish([job, *args], {
              scheduled: time
          })
        end

        private
        def queue
          TorqueBox.fetch(DEFAULT_QUEUE)
        end
      end
    end
  end
end