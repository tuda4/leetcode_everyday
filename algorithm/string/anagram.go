package string

import (
	"sort"
)

// solution: sort 2 string flow byte and compare they.
func IsAnagram(s string, t string) bool {
	if len(s) != len(t) {
		return false
	}
	sSort := sortString(s)
	tSort := sortString(t)
	return sSort == tSort
}

type sortRunes []rune

func (s sortRunes) Less(i, j int) bool {
	return s[i] < s[j]
}

func (s sortRunes) Swap(i, j int) {
	s[i], s[j] = s[j], s[i]
}

func (s sortRunes) Len() int {
	return len(s)
}

func sortString(s string) string {
	r := []rune(s)
	sort.Sort(sortRunes(r))
	return string(r)
}
