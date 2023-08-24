package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	// 处理GET请求,返回Hello World
	fmt.Fprintf(w, "Hello World!")
}

func main() {

	http.HandleFunc("/", handler)

	// 监听8080端口
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		fmt.Println(err)
		return
	}

	fmt.Println("HTTP server started on port 8080")

}
