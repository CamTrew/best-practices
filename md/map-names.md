When checking if a map contains a key, name the variable `ok`.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
name, nameIsPresent := userMap["TheGoDev"]
name, isPresent := userMap["TheGoDev"]
name, exists := userMap["TheGoDev"]
```

</td><td>

```go
name, ok := userMap["TheGoDev"]
```
</td>
</tr>
</tbody>
</table>
