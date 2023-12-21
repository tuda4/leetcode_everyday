package main

import (
	"fmt"
	"learn-golang/algorithm/array"
)

func main() {
	points := [][]int{{1, 0}, {8, 7}, {9, 9}, {7, 4}, {9, 7}}
	fmt.Println(array.MaxWidthOfVerticalArea(points))
}
