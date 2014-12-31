#!/usr/bin/env ruby

puts '-> loaded ~/.irbrc'

require 'rubygems'

begin
  require 'awesome_print'
rescue LoadError
  puts '-> skipped awesome_print'
end

begin
  require 'pry'
  Pry.start
  exit

rescue LoadError => e
  warn "=> Unable to load pry, loading regular irbrc..."

  puts <<-TEXT

Cheatsheet
  Object#ls            - overview of an object (looksee)
  Object#local_methods - list only local methods
  copy(str)            - put string into buffer
  copy_history         - put history into buffer

TEXT

  require 'irb/completion'
  require 'irb/ext/save-history'

  IRB.conf[:SAVE_HISTORY] = 1000
  IRB.conf[:HISTORY_FILE] = "/Users/max/.irb_history"
  IRB.conf[:PROMPT_MODE] = :SIMPLE

  %w[looksee/shortcuts wirble].each do |gem|
    begin
      require gem
    rescue LoadError
    end
  end

  class Object
    def local_methods(obj = self)
      (obj.methods - obj.class.superclass.instance_methods).sort
    end

    # print documentation
    #
    #   ri 'Array#pop'
    #   Array.ri
    #   Array.ri :pop
    #   arr.ri :pop
    def ri(method = nil)
      unless method && method =~ /^[A-Z]/ # if class isn't specified
        klass = self.kind_of?(Class) ? name : self.class.name
        method = [klass, method].compact.join('#')
      end
      system 'ri', method.to_s
    end
  end

  def copy(str)
    IO.popen('pbcopy', 'w') { |f| f << str.to_s }
  end

  def copy_history
    history = Readline::HISTORY.entries
    index = history.rindex("exit") || -1
    content = history[(index+1)..-2].join("\n")
    puts content
    copy content
  end

  load File.dirname(__FILE__) + '/.railsrc' if ($0 == 'irb' && ENV['RAILS_ENV']) || ($0 == 'script/rails' && Rails.env)
end
