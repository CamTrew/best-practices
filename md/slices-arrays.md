Set the length of the slice if you know what it will be. This prevents the reallocation of memory.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
func idsFromUsers(arr []user) []string {
    var ids []string // no length set
    for _, val := range arr {
      ids = append(ids, val.ID)
    }
    return ids
}
```

</td><td>

```go
func idsFromUsers(arr []user) []string {
    ids := make([]string, len(arr)) // length set
    for i, val := range arr {
      ids[i] = val.ID
    }
    return ids
}
```
</td>
</tr>
</tbody>
</table>

Set the capacity of a slice if you know roughly what the length will be. This reduces the number of times Go has to reallocate memory.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
func validUserIDs(arr []user) []string {
    var ids []string // no capacity set
    for _, val := range arr {
        if val.Age > 18 {
          ids = append(ids, val.ID)
        }
    }
    return ids
}
```

</td><td>

```go
func validUserIDs(arr []user) []string {
    ids := make([]string, 0, len(arr)) // capacity set
    for _, val := range arr {
        if val.Age > 18 {
          ids = append(ids, val.ID)
        }
    }
    return ids
}
```
</td>
</tr>
</tbody>
</table>
