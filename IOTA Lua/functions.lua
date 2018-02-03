function totrytes(input)
	local tryte_chars = {
		[0] = '9', [1] = 'A',
		[2] = 'B', [3] = 'C',
		[4] = 'D', [5] = 'E',
		[6] = 'F', [7] = 'G',
		[8] = 'H', [9] = 'I',
		[10] = 'J', [11] = 'K',
		[12] = 'L', [13] = 'M',
		[14] = 'N', [15] = 'O',
		[16] = 'P', [17] = 'Q',
		[18] = 'R', [19] = 'S',
		[20] = 'T', [21] = 'U',
		[22] = 'V', [23] = 'W',
		[24] = 'X', [25] = 'Y',
		[26] = 'Z'
	}
    local trytes = ""

	for i=1, string.len(input) do
		local first, second, trytevalue, byte, char = 0,0,'',0,''
		local tmp = input

		char = tmp:sub(i, i)

		byte = char:byte()

		if byte > 255 then
			return nil
		end
		
		first = byte % 27
		second = (byte - first) / 27
		
		trytevalue = tryte_chars[first]..tryte_chars[second]
		trytes = trytes..trytevalue
	end
	
	return trytes
end