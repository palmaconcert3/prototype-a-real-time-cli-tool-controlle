#!/usr/bin/env ruby

require 'io/console'

class CLIController
  def initialize
    @commands = {
      'quit' => method(:quit),
      'help' => method(:help),
      # Add more commands here
    }
  end

  def run
    loop do
      print '> '
      input = gets.chomp
      command, *args = input.split
      if @commands.key?(command)
        @commands[command].call(*args)
      else
        puts "Unknown command: #{command}"
      end
    end
  end

  private

  def quit
    exit
  end

  def help
    puts 'Available commands:'
    @commands.each_key do |command|
      puts "  #{command}"
    end
  end

  # Add more command methods here
end

controller = CLIController.new
controller.run