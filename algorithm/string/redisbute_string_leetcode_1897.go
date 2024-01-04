package string2

func MakeEqual(words []string) bool {
	strMap := map[rune]int{}
	for _, word := range words {
		for _, char := range word {
			strMap[char]++
		}
	}
	temp := strMap[rune(words[0][0])]
	for _, value := range strMap {
		if temp != value {
			return false
		}
	}

	return true
}
