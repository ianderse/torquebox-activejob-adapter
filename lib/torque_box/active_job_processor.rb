module TorqueBox
  class ActiveJobProcessor < TorqueBox::Messaging::MessageProcessor
    def on_message(args)
      job = args.shift
      job.new.execute(*args)
    end
  end
end