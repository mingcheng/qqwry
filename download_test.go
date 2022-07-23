package main

import (
	"io/ioutil"
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

	err = ioutil.WriteFile("qqwry.dat", got, 0644)
	if err != nil {
		t.Error(err)
	}
}
