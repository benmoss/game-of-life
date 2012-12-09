require 'pry'

class WorldAdvancer
  def self.next_tick(world)
    old_world = Marshal.load(Marshal.dump(world))

    old_world.each_with_index do |row, row_number|
      row.each_with_index do |cell, cell_number|
        CellUpdater.update_cell_at(row_number, cell_number, old_world, world)
      end
    end
    nil
  end
end

class CellUpdater
  def self.update_cell_at(row_number, cell_number, old_world, new_world)
    upper_left   = [row_number - 1, cell_number - 1]
    upper        = [row_number - 1, cell_number]
    upper_right  = [row_number - 1, cell_number + 1]
    left         = [row_number, cell_number - 1]
    right        = [row_number, cell_number + 1]
    bottom_left  = [row_number + 1, cell_number - 1]
    bottom       = [row_number + 1, cell_number]
    bottom_right = [row_number + 1, cell_number + 1]

    neighbor_locations = [upper_left, upper, upper_right, left, right, bottom_left, bottom, bottom_right]

    possible_locations = neighbor_locations.select do |location|
      location[0] >= 0 &&
        location[1] >= 0 &&
        location[0] <= old_world.size - 1 &&
        location[1] <= old_world.size - 1
    end

    neighbors = []
    possible_locations.each do |location|
      neighbors << old_world.fetch(location[0]).fetch(location[1])
    end

    if neighbors.count { |c| c.nonzero? } > 3
      new_world[row_number][cell_number] = 0
    end

    if neighbors.count { |c| c.nonzero? } == 3
      new_world[row_number][cell_number] = 1
    end

    nil
  end
end
