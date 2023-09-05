Use pointer receivers where appropriate to prevent Go from creating a copy of the object.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
func (p person) Greet() {}
```

</td><td>

```go
func (p *person) Greet()
```
</td>
</tr>
</tbody>
</table>
