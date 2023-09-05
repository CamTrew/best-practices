Rather than revealing the fields on an object by using a regular factory function, we can return an interface instead. This allows us to keep the object private and only export the interface.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
package ops

type Operations struct {
  // ...
}

func (o *Operations) DoThis() {}

func New() Operations {
  return Operations{}
}
```

</td><td>

```go
package ops

type Operator interface {
  DoThis()
}

type ops struct {
  // ...	
}

func (o *ops) DoThis() {}

func New() Operator {
  return &ops{}
}
```
</td>
</tr>
</tbody>
</table>

*It is worth noting that the 'revive' linter will throw an error. We think this is a great way to hide implementation and as a result turn off the linter.* 
