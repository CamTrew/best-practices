Set the capacity of a map if you know roughly what the size will be. This reduces the number of times Go has to reallocate memory.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
func hasDuplicates(items []string) bool {
    m := make(map[string]bool) // no capacity set
    for _, val := range items {
        if _, ok := m[val]; ok {
          return true
        }
        m[val] = true
    }
    return false
}
```

</td><td>

```go
func hasDuplicates(items []string) bool {
    m := make(map[string]bool, len(items)) // capacity set
    for _, val := range items {
        if _, ok := m[val]; ok {
          return true
        }
        m[val] = true
    }
    return false
}
```
</td>
</tr>
</tbody>
</table>
