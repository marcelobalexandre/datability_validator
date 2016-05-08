class DefaultTest < DatabilityValidatorTest
  def test_default_validate_datability
    SampleModel.validates(:date, datability: true)

    allow_valid(['2016-01-01', Time.zone.now])
    disallow_invalid(
      ['2016-30-30', '01012016'],
      I18n.t(:invalid, scope: [:errors, :messages])
    )
  end
end
