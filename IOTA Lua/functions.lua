tryte_chars = {
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

function table_invert(t)
	local s={}

	for k,v in pairs(t) do
		s[v]=k
	end

	return s
end

function fromtrytes(input)
	local output, first, second, decimal, offset, setyrt = "", 0, 0, 0, 0, table_invert(tryte_chars)
	
	if string.len(input) % 2 ~= 0 then return nil end
	
	for i=1, string.len(input) / 2 do
		first = input:sub(i+offset, i+offset)
		second = input:sub(i+1+offset, i+1+offset)
		
		offset = offset + 1
		decimal = setyrt[first] + setyrt[second] * 27
		
		output = output..string.char(decimal)
	end
	
	return output

end


function totrytes(input)
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