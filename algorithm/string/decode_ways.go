package string2

import (
	"fmt"
	"strings"
)

func isValid(code int, len int) bool {
	if len == 1 {
		return code >= 1 && code <= 26
	}
	if len == 2 {
		return code >= 10 && code <= 26
	}
	return false
}

func NumDecodings(s string) int {
	fmt.Println(decodeString(s))
	return 1
}
func decodeString(s string) string {
	var decoded strings.Builder

	// Split the string into individual numbers
	numbers := strings.Fields(s)

	for _, numStr := range numbers {
		// Convert the number string to an integer
		position := 0
		fmt.Sscanf(numStr, "%d", &position)

		// Convert the position to the corresponding uppercase letter
		if position >= 1 && position <= 26 {
			char := 'A' + rune(position-1)
			decoded.WriteRune(char)
		} else {
			// If the number is outside the valid range, keep it unchanged
			decoded.WriteString(numStr)
		}
	}

	return decoded.String()
}
