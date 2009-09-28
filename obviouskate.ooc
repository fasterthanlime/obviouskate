import io/[FileReader]
import structs/Array

main: func(args: Array<String>) {
	
	if(args size() <= 1) {
		("Usage: " + args get(0) + " FILE") println()
		exit(0)
	}
	
	args each(mingle)
	
}

mingle: func <T> (path: String@) {
	
	isFirst := static true
	if(isFirst) { isFirst = false; return }
	
	fr := FileReader new(path)
	
	v : UInt32
	max := 5
	index := 0
	printf("[")
	while(fr hasNext()) {
		fr read(v& as String, 0, UInt32 size)
		printf("0x%s", v as LLong toHexString())
		if(fr hasNext()) printf(",\t")
		index += 1
		if(index > max) {
			index = 0
			println()
		}
	}
	printf("]")
	println()
	
}
