require "spec_helper"
require "support/constant_helpers"

RSpec.describe TriggeredJob::Base do
  describe ".triggered_by" do
    context "missing required attributes" do
      it "raises exception when missing :table" do
        begin
          expect {
            class A < TriggeredJob::Base
              triggered_by field: "my_field"
            end
          }.to raise_error(ArgumentError, /table/)
        ensure
          remove_constants :A
        end
      end

      it "raises exception when missing :field" do
        begin
          expect {
            class A < TriggeredJob::Base
              triggered_by table: "my_table"
            end
          }.to raise_error(ArgumentError, /field/)
        ensure
          remove_constants :A
        end
      end
    end

    it "registers table+field trigger with itself" do
      begin
        class A < TriggeredJob::Base
          triggered_by table: "table", field: "field"
        end

        expect(TriggeredJob.triggered_by("table__field")).to contain_exactly("A")
      ensure
        TriggeredJob.clear
        remove_constants :A
      end 
    end
  end
end
