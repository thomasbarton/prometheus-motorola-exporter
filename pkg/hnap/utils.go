package hnap

import (
	"strconv"
	"strings"
)

// parseInt parses a string into an int64 with a base of 10 and a bit size of 64
func parseInt64(s string) (int64, error) {
	return strconv.ParseInt(strings.TrimSpace(s), 10, 64)
}

// parseFloat parses a string into a float64 with a bit size of 64
func parseFloat64(s string) (float64, error) {
	return strconv.ParseFloat(strings.TrimSpace(s), 64)
}
