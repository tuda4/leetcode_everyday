package array

func OnesMinusZeros(grid [][]int) [][]int {
	m := len(grid)
	n := len(grid[0])

	rows := make([]int, m)
	cols := make([]int, n)
	for i := 0; i < m; i++ {
		for j := 0; j < n; j++ {
			rows[i] += grid[i][j] * 2
			cols[j] += grid[i][j] * 2
		}
	}
	for i := 0; i < m; i++ {
		for j := 0; j < n; j++ {
			grid[i][j] = rows[i] + cols[j] - m - n
		}
	}
	return grid
}
