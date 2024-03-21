package array

import (
	"strconv"
)

func temp(el string, result []int) []int {
	var (
		x int
	)

	maxLenRes := len(result)
	switch el {
	case "D":
		{
			// double
			x = result[maxLenRes-1] * 2
			result = append(result, x)
		}
	case "C":
		{
			// cancel
			result = result[:maxLenRes-1]
		}
	case "+":
		{
			// plus
			x = result[maxLenRes-1] + result[maxLenRes-2]
			result = append(result, x)
		}
	default:
		x, _ = strconv.Atoi(el)
		result = append(result, x)
	}

	return result
}

func sum(array []int) int {
	var result int
	for i := range array {
		result += array[i]
	}

	return result
}

func CalPoints(operations []string) int {
	var result []int
	for i := range operations {
		result = temp(operations[i], result)
	}

	return sum(result)
}
