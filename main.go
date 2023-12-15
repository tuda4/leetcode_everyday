package main

import (
	"fmt"
	"learn-golang/algorithm/array"
)

func main() {
	grid := [][]int{{1, 1, 1}, {1, 1, 1}}
	fmt.Println(array.OnesMinusZeros(grid))
}
