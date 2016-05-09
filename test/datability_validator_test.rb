require 'test_helper'

class DatabilityValidatorTest < Minitest::Test
  def setup
    @today = Time.zone.now
    @today_as_string = @today.to_s
    @today_as_localized_string = DateLocalizer.localize(@today)

    @yesterday = Time.zone.now - 1.day
    @yesterday_as_string = @yesterday.to_s
    @yesterday_as_localized_string = DateLocalizer.localize(@yesterday)

    @tomorrow = Time.zone.now + 1.day
    @tomorrow_as_string = @tomorrow.to_s
    @tomorrow_as_localized_string = DateLocalizer.localize(@tomorrow)
  end

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
