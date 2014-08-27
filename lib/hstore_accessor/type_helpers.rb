module HstoreAccessor
  module TypeHelpers
    def self.cast(type, value)
      return nil if value.nil?

      case type
      when :string, :hash, :array, :decimal
        value
      when :integer, :float, :time, :date, :boolean
        ActiveRecord::Base.connection.lookup_cast_type(type).type_cast_from_user(value)
      else value
        # Nothing.
      end
    end
  end
end
