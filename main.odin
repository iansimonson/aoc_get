package aoc_get

import "core:fmt"
import "core:net"
import "core:os"
import http "shared:odin-http"
import "shared:odin-http/client"


main :: proc() {
    assert(len(os.args) > 2)
    session_token := os.args[1]
    day := os.args[2]

    year := "2023"
    if len(os.args) > 3 {
        year = os.args[2]
    }

    get(session_token, year, day)

}

get :: proc(token, year, day: string) {
    url := fmt.tprintf("https://adventofcode.com/%s/day/%s/input", year, day)
    context.allocator = context.temp_allocator
    req: client.Request
    client.request_init(&req, .Get)
    append(&req.cookies, http.Cookie{name = "session", value = token, domain = "adventofcode.com"})
    defer client.request_destroy(&req)


    res, err := client.request(url, &req)
    if err != nil {
        fmt.printf("Request failed: %s", err)
        return
    }

    body, alloc, berr := client.response_body(&res)
    if berr != nil {
        fmt.printf("Error getting body: %s", berr)
        return
    }

    fmt.println(body)
}