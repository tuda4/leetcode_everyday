package array

import (
	"sort"
)

func BuyChoco(prices []int, money int) int {
	sort.Slice(prices, func(i, j int) bool {
		return prices[i] < prices[j]
	})
	minTwoPrices := prices[0] + prices[1]
	if remainMoney := money - minTwoPrices; remainMoney >= 0 {
		return remainMoney
	}

	return money
}
