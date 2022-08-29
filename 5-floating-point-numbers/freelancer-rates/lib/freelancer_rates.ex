defmodule FreelancerRates do
  import Float, only: [floor: 2]

  @daily_rate 8.0
  @monthly_billable_days 22

  def daily_rate(hourly_rate), do: @daily_rate * hourly_rate

  def apply_discount(before_discount, discount_percentage) do
    discount = before_discount / 100 * discount_percentage

    before_discount - discount
  end

  def monthly_rate(hourly_rate, discount_percentage) do
    @monthly_billable_days * daily_discounted_rate(hourly_rate, discount_percentage)
    |> ceil()
  end

  def days_in_budget(budget, hourly_rate, discount_percentage) do
    budget / daily_discounted_rate(hourly_rate, discount_percentage)
    |> floor(1)
  end

  defp daily_discounted_rate(hourly_rate, discount_percentage) do
    hourly_rate
    |> daily_rate()
    |> apply_discount(discount_percentage)
  end
end
