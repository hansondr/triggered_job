require "spec_helper"
require "support/constant_helpers"

RSpec.describe TriggeredJob do
  describe ".clear" do
    it "clears the stored triggered jobs" do
      TriggeredJob.set_trigger("alpha", Struct)

      expect(TriggeredJob.triggered_by("alpha")).to contain_exactly("Struct")
      TriggeredJob.clear

      expect(TriggeredJob.triggered_by("alpha")).to be nil
    end
  end

  describe ".triggered_by" do
    it "returns groups of class names by trigger" do
      begin
        class A; end
        class B; end
        class C; end
        TriggeredJob.set_trigger("alpha", A)
        TriggeredJob.set_trigger("alpha", B)
        TriggeredJob.set_trigger("beta", C)

        expect(TriggeredJob.triggered_by("alpha")).to contain_exactly("A", "B")
        expect(TriggeredJob.triggered_by("beta")).to contain_exactly("C") 
      ensure
        TriggeredJob.clear
        remove_constants :A, :B, :C
      end
    end
  end

  describe ".set_trigger" do
    context "with both parameters" do
      it "does not throw an exception" do
        begin
          class A; end

          expect { TriggeredJob.set_trigger("alpha", A) }.not_to raise_error
        ensure
          TriggeredJob.clear
          remove_constants :A
        end
      end
    end

    context "invalid parameters" do
      it "throws exception when trigger is nil" do
        begin
          class A; end

          expect { TriggeredJob.set_trigger(nil, A ) }.to raise_error(ArgumentError, /[t|T]rigger.*null/)
        ensure
          TriggeredJob.clear
          remove_constants :A
        end
      end

      it "throws exception when klass is nil" do
        begin
          expect { TriggeredJob.set_trigger("error", nil) }.to raise_error(ArgumentError, /[k|K]lass.*null/)
        ensure
          TriggeredJob.clear
        end
      end

      it "throws exception when klass is not a class" do
        begin
          expect { TriggeredJob.set_trigger("error", "class") }.to raise_error(ArgumentError, /[c|C]lass/)
        ensure
          TriggeredJob.clear
        end
      end
    end
  end
end
