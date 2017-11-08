#!/usr/bin/ruby
require 'colorize'
puts 'Please enter the package name or q to quit:'
args = gets.chomp
if args != 'q'
  result = `sudo apt search #{args}`
  var = result.split("\n")
  if var[2] != nil
    i = 2
    x = 1
    packages = []
    puts 'Select a package to install:'
    puts ''
    until i >= var.length
    	if var[i].include?(args)
	      puts "[#{x}] #{var[i]}".green
	      packages[x] = var[i]
	      if var[i+1] != nil
	        puts "#{var[i+1]}"
	      end
	      puts ''
	      x = x + 1
	    end
      i = i + 3
    end
    puts 'Enter the package number or 0 to cancel: '
    number = gets.chomp.to_i
    if number != 0
      pack = packages[number]
      finalPack = pack.split('/')
      system("sudo apt-get install #{finalPack[0]}")
    end
  else
    puts 'Package not found'
  end
end