Getters in Go are encouraged, but we should remove the Get in the function name. The receiver variable should be a single letter.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
func (person *Person) GetName() string {
  return person.Name
}
```

</td><td>

```go
func (p *Person) Name() string {
  return p.Name
}
```
</td>
</tr>
</tbody>
</table>
