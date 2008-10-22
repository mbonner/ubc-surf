module TripAdminHelper
  def total_rental_cost_column(record)
    return number_to_currency(record.total_rental_cost)
  end
  def cost_column(record)
    return number_to_currency(record.cost)
  end
end
