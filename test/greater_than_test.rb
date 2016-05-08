class GreaterThanTest < DatabilityValidatorTest
  def test_greater_than_with_proc
    SampleModel.validates(
      :date,
      datability: { greater_than: Proc.new { Time.zone.now } }
    )

    allow_valid([Time.zone.now + 1.day])
    disallow_invalid(
      [Time.zone.now - 1.day, Time.zone.now],
      I18n.t(
        :greater_than,
        scope: [:errors, :messages],
        count: DateLocalizer.localize(Time.zone.now)
      )
    )
  end
end
