package string2

import "fmt"

// solution::: if current character path origin return true. else asign new value of origin.
func IsPathCrossing(path string) bool {
	origin := [2]int{0, 0}
	data := make(map[[2]int]bool)
	data[origin] = true
	for _, p := range path {
		s := fmt.Sprintf("%c", p)
		switch s {
		case "N":
			origin[1] += 1
		case "E":
			origin[0] += 1
		case "S":
			origin[1] -= 1
		case "W":
			origin[0] -= 1
		}
		if data[origin] {
			return true
		}
		data[origin] = true
	}

	return false
}
