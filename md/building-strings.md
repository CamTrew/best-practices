Strings are immutable in Go. Therefore, constructing a string requires multiple memory reallocations. Instead, use `strings.Builder`.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
func greet(name string) string {
    greet := "Hello "
    if name != "" {
      greet += name
    } else {
      greet += "World"
    }
    greet += "!"
    return greet
}
```

</td><td>

```go
func greet(name string) string {
    var b strings.Builder
    b.WriteString("Hello ")
    
    if name != "" {
      b.WriteString(name)
    } else {
      b.WriteString("World")
    }
    b.WriteString("!")
    
    return b.String()
}
```
</td>
</tr>
</tbody>
</table>
