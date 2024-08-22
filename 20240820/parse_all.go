package main

import (
	"fmt"
	"io/ioutil"
	"strings"
)

func main() {
	content, err := ioutil.ReadFile("all.txt")
	if err != nil {
		fmt.Println("文件读取失败！", err)
		return
	}

	cs := make(map[string][]string)

	lines := strings.Split(string(content), "\n")
	for _, line := range lines {
		cols := strings.Split(line, " - ")
		if len(cols) != 2 {
			continue
		}
		_, exist := cs[cols[1]]
		if !exist {
			cs[cols[1]] = make([]string, 0)
		}
		cs[cols[1]] = append(cs[cols[1]], cols[0])
	}

	for k, v := range cs {
		fmt.Printf("%d %s [%v]\n", len(v), k, strings.Join(v, ","))
	}
}
