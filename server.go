package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello GitOps!")
}
func main() {
	http.HandleFunc("/", handler)
	fmt.Println("Go server running on port 3ooo")
	http.ListenAndServe(":3000", nil)
}