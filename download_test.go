package main

import (
	"testing"
)

func Test_getKey(t *testing.T) {
	got, err := getKey()
	if err != nil {
		t.Errorf("getKey() error = %v", err)
		return
	}

	t.Log(got)
}

func TestGetOnline(t *testing.T) {
	got, err := GetOnline()
	if err != nil {
		t.Errorf("GetOnline() error = %v", err)
		return
	}

	if len(got) <= 0 {
		t.Errorf("GetOnline() error, response empty")
		return
	}
}
