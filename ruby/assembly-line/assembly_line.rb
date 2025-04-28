class AssemblyLine
  BASE_ITEMS_PRODUCED_BY_HOUR = 221

  def initialize(speed)
    @speed = speed
  end

  def production_rate_per_hour
    if @speed >= 1 && @speed <= 4
      BASE_ITEMS_PRODUCED_BY_HOUR * @speed
    elsif @speed >= 5 && @speed <= 8
      (BASE_ITEMS_PRODUCED_BY_HOUR * @speed) * 0.9
    elsif @speed == 9
      (BASE_ITEMS_PRODUCED_BY_HOUR * @speed) * 0.8
    else
      (BASE_ITEMS_PRODUCED_BY_HOUR * @speed) * 0.77
    end
  end

  def working_items_per_minute
    items_per_minute = production_rate_per_hour / 60

    items_per_minute.floor
  end
end
