#!/usr/bin/env ruby

puts '-> loaded ~/.pryrc'

Pry.config.editor = "subl -w"

Pry.config.prompt = [
  proc do |obj, nest_level, pry|
    obj_name = Pry.view_clip(obj)
    obj_name == 'main' ? ">> " : "#{obj_name} > "
  end,

  proc do |obj, nest_level, pry|
    obj_name = Pry.view_clip(obj)
    obj_name == 'main' ? ">> " : "#{obj_name}   "
  end
]
