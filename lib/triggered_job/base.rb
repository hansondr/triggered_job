module TriggeredJob
  class Base
    def self.triggered_by(table: nil, field: nil)
      raise ArgumentError, ":table argument is required" if table.nil?
      raise ArgumentError, ":field argument is required" if field.nil?

      TriggeredJob.set_trigger([table, field].join("__"), self)
    end
  end
end
