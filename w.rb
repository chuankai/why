File.open(ARGV[0], 'w') do |f|
	f.print \x01
	f.print \x02
end
