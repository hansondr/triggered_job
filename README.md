# Triggered Job

Simple framework for trigger-based jobs

## Installation

`gem 'triggered_job'`

## Usage

Create a base job and mix in your async worker library of choice

### Sidekiq

```
class BaseJob < TriggeredJob::Base
  include Sidekiq::Worker
end

class MyTriggeredJob < BaseJob
  triggered_by "my_trigger"

  def perform(id, *args)
    # ...
  end
end
```

Create a subscription process

### Eventmachine Redis example

```
require 'em-hiredis'
require 'json'

EM.run {
  redis = EM::Hiredis.connect
  redis.pubsub.psubscribe('MY_PREFIX.*') do |channel, data|
    trigger = channel.gsub(/MY_PREFIX\./, '')
    id = (JSON.parse(data))["id"]

    jobs = TriggeredJob.triggered_by(trigger)
    unless jobs.nil?
      jobs.each { |job| job.constantize.perform_async(id) }
    end
  end
}
```

