require 'test_helper'

class DatabilityValidatorTest < Minitest::Test
  def teardown
    SampleModel.clear_validators!
  end

  protected

  def allow_valid(values)
    values.each do |value|
      sample_model = SampleModel.new(date: value)

      assert(
        sample_model.valid?,
        "#{value.inspect} not accepted as a date with validation error: #{sample_model.errors[:date].first}"
      )
    end
  end

  def disallow_invalid(values, expected_error)
    values.each do |value|
      sample_model = SampleModel.new(date: value)

      assert(sample_model.invalid?, "#{value.inspect} not rejected as a date")
      assert(sample_model.errors[:date].any?, "FAILED for #{value.inspect}")

      if expected_error
        assert_equal(expected_error, sample_model.errors[:date].first)
      end
    end
  end
end
