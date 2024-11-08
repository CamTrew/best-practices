When checking if a map contains a key, name the variable `ok`.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
name, nameIsPresent := userMap["CamTrew"]
name, isPresent := userMap["CamTrew"]
name, exists := userMap["CamTrew"]
```

</td><td>

```go
name, ok := userMap["CamTrew"]
```
</td>
</tr>
</tbody>
</table>
