module TriggeredJob
  class Base
    def self.triggered_by(trigger)
      TriggeredJob.set_trigger(trigger, self)
    end
  end
end
