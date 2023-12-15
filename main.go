package main

import (
	"fmt"
	string2 "learn-golang/algorithm/string"
)

func main() {
	paths := [][]string{{"B", "C"}, {"D", "B"}, {"C", "A"}}
	fmt.Println(string2.DestinationCity(paths))
}
