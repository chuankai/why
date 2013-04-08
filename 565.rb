data = "\x81\x81\x81\xd0\x5a\x5a"
rgb565 = Array.new(2)

bytes = data.unpack('C*')

puts '=== bytes ==='
puts bytes[0].to_s(16)
puts bytes[1].to_s(16)
puts bytes[2].to_s(16)

bytes[0] &= 0xf8
bytes[1] &= 0xfc
bytes[2] &= 0xf8

rgb565[0] = bytes[0] + (bytes[1] >> 5)
rgb565[1] = ((bytes[1] << 3) & 0xff) + (bytes[2] >> 3)

puts '=== rgb565 ==='
puts rgb565[0].to_s(16)
puts rgb565[1].to_s(16)
