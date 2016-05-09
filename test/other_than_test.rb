class OtherThanTest < DatabilityValidatorTest
  def test_other_than_with_proc
    [@today, @today_as_string, @today_as_localized_string].each do |today|
      SampleModel.validates(
        :date,
        datability: { other_than: Proc.new { today } }
      )

      valid_values = [
        @yesterday,
        @yesterday_as_string,
        @yesterday_as_localized_string,
        @tomorrow,
        @tomorrow_as_string,
        @tomorrow_as_localized_string
      ]
      allow_valid(valid_values)

      invalid_values = [
        @today,
        @today_as_string,
        @today_as_localized_string
      ]
      disallow_invalid(
        invalid_values,
        I18n.t(
          :other_than,
          scope: [:errors, :messages],
          count: @today_as_localized_string
        )
      )
    end
  end

  def test_other_than_with_symbol
    [@today, @today_as_string, @today_as_localized_string].each do |today|
      begin
        SampleModel.send(:define_method, :another_date, -> { today })

        SampleModel.validates(
          :date,
          datability: { other_than: :another_date }
        )

        valid_values = [
          @yesterday,
          @yesterday_as_string,
          @yesterday_as_localized_string,
          @tomorrow,
          @tomorrow_as_string,
          @tomorrow_as_localized_string
        ]
        allow_valid(valid_values)

        invalid_values = [
          @today,
          @today_as_string,
          @today_as_localized_string
        ]
        disallow_invalid(
          invalid_values,
          I18n.t(
            :other_than,
            scope: [:errors, :messages],
            count: 'Another date'
          )
        )
      ensure
        SampleModel.send(:remove_method, :another_date)
      end
    end
  end
end
