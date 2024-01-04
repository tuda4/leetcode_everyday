package main

import (
	"fmt"
	string2 "learn-golang/algorithm/string"
)

func main() {
	words := []string{"ab", "a"}
	result := string2.MakeEqual(words)

	fmt.Println(result)
}
