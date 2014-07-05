# Torquebox::Activejob::Adapter

This is a prototype implementation of a ActiveJob MessageProcessor for Torquebox3 and rails 4.

CAUTION: This code is experimental and is very likely to break / change, use on your own risk.

## Installation

Add this line to your application's Gemfile:

    gem 'activejob', github: 'rails/activejob'
    gem 'torquebox-activejob-adapter', '0.0.2'


Add this specification to your config/torquebox.yml

    queues:
      /queues/active_job:
    messaging:
      /queues/active_job:
        TorqueBox::ActiveJobProcessor:
          concurrency: 1

You can bump the concurrency value higher when running in production since torquebox will use a shared runtime for
message processors.

Create a initializer filer with the following content:
    
    begin
      using_torquebox = ENV['TORQUEBOX_APP_NAME'].present?
      
      if using_torquebox
        ActiveJob::Base.queue_adapter = ActiveJob::QueueAdapters::TorqueboxAdapter
      end
    end

## Todo
- Figure out how to test this thing
- Add tests
