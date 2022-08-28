defmodule Rules do
  def eat_ghost?(power_pellet_active, touching_ghost), do: power_pellet_active and touching_ghost

  def score?(touching_power_pellet, touching_dot), do: touching_power_pellet or touching_dot

  def lose?(_power_pellet_active = false, _touching_ghost = true), do: true
  def lose?(_power_pellet_active, _touching_ghost), do: false

  def win?(
        _has_eaten_all_dots = true,
        _power_pellet_active = false,
        _touching_ghost = true
      ),
      do: false

  def win?(has_eaten_all_dots, power_pellet_active, touching_ghost) do
    has_eaten_all_dots or power_pellet_active or touching_ghost
  end
end
