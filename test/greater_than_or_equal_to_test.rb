class GreaterThanTest < DatabilityValidatorTest
  def test_greater_than_or_equal_to_with_proc
    SampleModel.validates(
      :date,
      datability: { greater_than_or_equal_to: Proc.new { Time.zone.now } }
    )

    allow_valid([Time.zone.now, Time.zone.now + 1.day])
    disallow_invalid(
      [Time.zone.now - 1.day],
      I18n.t(
        :greater_than_or_equal_to,
        scope: [:errors, :messages],
        count: DateLocalizer.localize(Time.zone.now)
      )
    )
  end
end
