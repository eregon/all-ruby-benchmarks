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
  include ChunkyPNG::Canvas::Operations

  public :compose!

  def initialize
    @pixels = Array.new(width * height, 0x12345678)
  end

  def width
    4000
  end

  def height
    4000
  end

  def pixels
    @pixels
  end

  def get_pixel(x, y)
    @pixels[y * width + x]
  end

  def set_pixel(x, y, color)
    @pixels[y * width + x] = color
  end
end

a = MockCanvas.new
b = MockCanvas.new

benchmark do
  a.replace!(b, 0, 0)
end
