package algorithms

import "core:fmt"
import "core:testing"

quicksort :: proc(arr: ^[]int, start: int, end: int) {
  if start < end {
    pivot := partition(arr, start, end)
    quicksort(arr, start, pivot - 1)
    quicksort(arr, pivot + 1, end)
  }
}

partition :: proc(arr: ^[]int, start: int, end: int) -> int {
  pivot := arr[end]
  swap_mark := start;
  for i in start..<end {
    if arr[i] <= pivot {
      swap(&arr[i], &arr[swap_mark])
      swap_mark += 1
    }
  }
  swap(&arr[swap_mark], &arr[end])
  return swap_mark
}

swap :: proc(addr1: ^int, addr2: ^int) {
  tmp := addr1^
  addr1^ = addr2^
  addr2^ = tmp
}

@(test)
check_if_sorting :: proc(_: ^testing.T) {
  arr := []int{ 5, 2, 6, 8, 9, 3, 1, 7, 4 }
  quicksort(&arr, 0, len(arr) - 1)
  fmt.println(arr)
}
