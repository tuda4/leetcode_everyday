package array

import (
	"sort"
)

// Big O(n log n)
func MaxWidthOfVerticalArea(points [][]int) int {
	latCoordinatesPoint := []int{}
	max := 0

	for _, point := range points {
		latCoordinatesPoint = append(latCoordinatesPoint, point[0])
	}
	// computational complexity O(n log n)
	sort.Ints(latCoordinatesPoint)

	for i := 0; i < len(latCoordinatesPoint)-1; i++ {
		a := latCoordinatesPoint[i+1] - latCoordinatesPoint[i]
		if a >= max {
			max = a
		}
	}

	return max
}
