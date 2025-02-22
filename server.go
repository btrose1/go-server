package main

import (
	"bufio"
	"fmt"
	"net"
	"strings"
)

func handleConnection(conn net.Conn) {
	defer conn.Close()
	fmt.Println("Client connected:", conn.RemoteAddr())

	reader := bufio.NewReader(conn)
	for {
		message, err := reader.ReadString('\n')
		if err != nil {
			fmt.Println("Client disconnected:", conn.RemoteAddr())
			return
		}
		message = strings.TrimSpace(message)
		fmt.Println("Receieved:", message)

		// Respond to the client
		response := fmt.Sprintf("Server received: %s\n", message)
		_, err = conn.Write([]byte(response))
	}
}
