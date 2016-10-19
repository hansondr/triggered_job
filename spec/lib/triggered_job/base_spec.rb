require "spec_helper"
require "support/constant_helpers"

RSpec.describe TriggeredJob::Base do
  describe ".triggered_by" do
    it "raises exception when trigger is missing" do
      begin
        expect {
          class A < TriggeredJob::Base
            triggered_by
          end
        }.to raise_error ArgumentError
      ensure
        remove_constants :A
      end
    end

    it "registers trigger with itself" do
      begin
        class A < TriggeredJob::Base
          triggered_by "table__field"
        end

        expect(TriggeredJob.triggered_by("table__field")).to contain_exactly("A")
      ensure
        TriggeredJob.clear
        remove_constants :A
      end 
    end
  end
end
