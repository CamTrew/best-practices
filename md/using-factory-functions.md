There is no concept of a constructor in Go. Instead, we create factory functions. These should be used for more complex objects to ensure the object is fully hydrated.

Use single letters and abbreviations for the parameters of the factory function and return a pointer for memory efficiency. Use the context of the package name when naming the function.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
package user

func NewUser(name string, age int) User {
    return User{
        name: name,
        age: age,
    }
}
```

</td><td>

```go
package user

func New(n string, a int) *User {
    return &User{
        name: n,
        age: a,
    }
}
```
</td>
</tr>
</tbody>
</table>
