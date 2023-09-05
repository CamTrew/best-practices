When writing table-driven unit tests, use a map rather than a slice. This simplifies the process of setting the test name. Although it's slower, performance in Go unit testing is rarely an issue.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
tests := []struct{
    name string
}{
    {
      name: "this is the test name",
    },
}
```

</td><td>

```go
tests := map[string]struct{
}{
    "this is the test name": {},
}
```
</td>
</tr>
</tbody>
</table>

Do not import a package to convert a variable to a pointer. Create your own and use `_test` as the package name to avoid accidental imports from the main application.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
import "github.com/aws/aws-sdk-go/aws"

tests := map[string]struct{
  age *int
}{
  "": {
    age: aws.Int(123)
  },
}
```

</td><td>

```go
package _test

func IntPtr(i int) *int {
	return &i
}

- - - - - - - - -

import "XXX/_test"

tests := map[string]struct{
  age *int
}{
  "": {
    age: _test.IntPtr(123)
  },
}
```
</td>
</tr>
</tbody>
</table>
