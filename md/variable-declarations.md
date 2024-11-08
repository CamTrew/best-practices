There are a number of ways to declare variables in Go. As a result, it is better to stick to a convention.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
person := Person{}
var person = Person{Name: "CamTrew"}
```

</td><td>

```go
var person Person
person := Person{Name: "CamTrew"}
```
</td>
</tr>
</tbody>
</table>

Avoid declaring new variables as pointers, as it is better to see the effect of passing a parameter as a pointer.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
person := &Person{Name: "CamTrew"}
ProcessPerson(person)
```

</td><td>

```go
person := Person{Name: "CamTrew"}
ProcessPerson(&person)
```
</td>
</tr>
</tbody>
</table>
