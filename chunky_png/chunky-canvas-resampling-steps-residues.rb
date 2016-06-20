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

  public :steps_residues
end

canvas = MockCanvas.new

benchmark do
  canvas.steps_residues(500_000, 1_000_000)
end
