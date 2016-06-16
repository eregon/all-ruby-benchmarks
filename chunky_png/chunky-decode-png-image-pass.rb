# Copyright (c) 2014, 2016 Oracle and/or its affiliates. All rights reserved.
# This code is released under a tri EPL/GPL/LGPL license. You can use it,
# redistribute it and/or modify it under the terms of the:
#
# Eclipse Public License version 1.0
# GNU General Public License version 2
# GNU Lesser General Public License version 2.1

class Set
end

class SortedSet < Set
end

$LOAD_PATH << File.join(File.dirname(__FILE__), 'chunky_png', 'lib')
require 'chunky_png'

WIDTH = 400
HEIGHT = 400
COLOR_MODE = ChunkyPNG::COLOR_TRUECOLOR_ALPHA
DEPTH = 8
PIXEL = 0x12345678

class MockCanvas
  extend ChunkyPNG::Canvas::PNGDecoding

  class << self
    public :decode_png_image_pass
  end

  def initialize(width, height, pixels)
    @width = width
    @height = height
    @pixels = pixels
  end

  def width
    @width
  end

  def height
    @height
  end

  def pixels
    @pixels
  end
end

pixel = [PIXEL].pack("N")
scan_line = [ChunkyPNG::FILTER_NONE].pack("c") + (pixel * WIDTH)
stream = scan_line * HEIGHT

benchmark do
  MockCanvas::decode_png_image_pass(stream, WIDTH, HEIGHT, COLOR_MODE, DEPTH, 0)
end