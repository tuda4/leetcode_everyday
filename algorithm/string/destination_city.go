package string2

func DestinationCity(paths [][]string) string {
	var destinationIndex0, destinationIndex1, pathDup []string
	for _, path := range paths {
		destinationIndex0 = append(destinationIndex0, path[0])
		destinationIndex1 = append(destinationIndex1, path[1])
	}
	pathCounts := map[string]int{}
	destinationIndexs := append(destinationIndex0, destinationIndex1...)
	for _, destinationIndex := range destinationIndexs {
		pathCounts[destinationIndex]++
	}
	var des string
	for path, count := range pathCounts {
		if count == 1 {
			for _, inclu := range destinationIndex1 {
				if path == inclu {
					des = path
				}
			}
		}
		pathDup = append(pathDup, path)
	}
	return des
}

// "Hash map path[0] into a map[string]bool where path[0] serves as the 'from' address,
// and path[1] serves as the 'to' address. Then, check if path[1] is included in that hash map.
// Return it if is not present."
func destCity(paths [][]string) string {
	dests := map[string]bool{}
	for _, path := range paths {
		dests[path[0]] = true
	}

	for _, path := range paths {
		if !dests[path[1]] {
			return path[1]
		}
	}

	return ""
}
