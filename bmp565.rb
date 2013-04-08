def convert(p)
	rgb565 = Array.new(2)
	bytes = p.unpack('C*')

	bytes[0] &= 0xf8
	bytes[1] &= 0xfc
	bytes[2] &= 0xf8

	rgb565[0] = bytes[0] + (bytes[1] >> 5)
	rgb565[1] = ((bytes[1] << 3) & 0xff) + (bytes[2] >> 3)

	return rgb565
end

File.open(ARGV[1], 'w') do |fout|
	File.open(ARGV[0]) do |f|
		f.pos = 54
		while s = f.read(3) do
			c = convert(s)		
			fout.print "0x#{c[0].to_s(16)}#{c[1].to_s(16)}," 
		end
	end
end


