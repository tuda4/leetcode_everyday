package main

import (
	"fmt"
)

func main() {

	fmt.Println(test("a"))
}

func test(str string) bool {
	pricesTest := map[string]bool{
		"holiday": true,
		"default": true,
		"sales":   true,
	}
	return pricesTest[str]
}
