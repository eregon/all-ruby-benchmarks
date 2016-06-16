# Copyright (c) 2014, 2016 Oracle and/or its affiliates. All rights reserved.
# This code is released under a tri EPL/GPL/LGPL license. You can use it,
# redistribute it and/or modify it under the terms of the:
#
# Eclipse Public License version 1.0
# GNU General Public License version 2
# GNU Lesser General Public License version 2.1

$LOAD_PATH << File.join(File.dirname(__FILE__), 'chunky_png', 'lib')
require 'chunky_png'

class MockCanvas
  include ChunkyPNG::Canvas::Resampling

  public :resample_nearest_neighbor!

  def initialize
    @pixels = Array.new(width * height, 0)

    @pixels.size.times do |n|
      @pixels[n] = 0x12345678
    end
  end

  def width
    100
  end

  def height
    100
  end

  def pixels
    @pixels
  end

  def get_pixel(x, y)
    @pixels[y * width + x]
  end

  def replace_canvas!(new_width, new_height, pixels)
    @width = new_width
    @height = new_height
    @pixels = pixels
  end
end

canvas = MockCanvas.new

benchmark do
  canvas.resample_nearest_neighbor!(500, 500)
end
