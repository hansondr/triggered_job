require "triggered_job/base"

module TriggeredJob
  @triggered_jobs = {}

  def self.set_trigger(trigger, klass)
    raise ArgumentError, "trigger cannot be null" if trigger.nil?
    raise ArgumentError, "klass cannot be null" if klass.nil?
    raise ArgumentError, "klass must be a Class" unless klass.is_a?(Class)

    if @triggered_jobs.key?(trigger) && !@triggered_jobs[trigger].empty?
      @triggered_jobs[trigger] << klass.to_s
    else
      @triggered_jobs[trigger] = [klass.to_s]
    end
  end

  def self.clear
    @triggered_jobs = {}
  end

  def self.triggered_by(trigger)
    @triggered_jobs[trigger]
  end
end
