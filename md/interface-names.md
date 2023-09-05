Should be a verb and not use abbreviations.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
type Operations interface {
  // ...
}

type Ops interface {
  // ...
}
```

</td><td>

```go
type Operator interface {
  // ...
}
```
</td>
</tr>
</tbody>
</table>

Include all parameter variable names of the methods in an interface except for the return values.


<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
type Operator interface {
  Create(context.Context, string, string) error
}

type Operator interface {
  Create(ctx context.Context, userID string, itemID string) (err error)
}
```

</td><td>

```go
type Operator interface {
  Create(ctx context.Context, userID string, itemID string) error
}
```
</td>
</tr>
</tbody>
</table>
