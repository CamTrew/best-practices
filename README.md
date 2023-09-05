# The Go Dev's

- [Introduction](#introduction)
- [Style](#style)
  - [Package Names](#package-names)
  - [Directory Names](#directory-names)
  - [Filenames](#filenames)
  - [Variable Names](#variable-names)
  - [Variable Declarations](#variable-declarations)
  - [Function Names](#function-names)
  - [Interface Names](#interface-names)
  - [Map Names](#map-names)
  - [Health Check Names](#health-check-names)
  - [Mock Package Names](#mock-package-names)
- [Guidelines](#guidelines)
  - [Using Factory Functions](#using-factory-functions)
  - [Using Interface Factories](#using-interface-factories)
  - [Testing](#testing)
- [Optimisation](#optimisation)
  - [Building Strings](#building-strings)
  - [Maps](#maps)
  - [Slices / Arrays](#slices--arrays)
  - [Types](#types)
- [References](#references)

## Introduction

Following best practices and conventions improves the quality and consistency of a codebase. There are many great style guides out there for Go, such as:
- [Effective Go](https://go.dev/doc/effective_go)
- [Uber's Style Guide](https://github.com/uber-go/guide/blob/master/style.md)
- [Ardan Labs](https://www.ardanlabs.com/)

These resources have influenced the conventions listed in this guide. However, we have taken a different approach by tackling more day-to-day concerns. Many surface-level issues will be solved by gofmt and your linter, so we will be digging deeper than that.

This guide is dynamic and should evolve over time. If you have any additions or modifications, please create a merge request and leave a comment with your explanation.

## Style

### Package Names

Single short and concise word with no mixed case or underscores. Use abbreviations and do not worry about future package name clashes.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
package user_repository
```

</td><td>

```go
package repo
```
</td>
</tr>
</tbody>
</table>

Clashes are handled by the importing package. Do not use underscores or camelCase. Often the parent directory name can be used as a prefix or suffix.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
import (
  user_repo "XXX/repo/user"
  userSvc "XXX/svc/user"
  schema_user "XXX/schema/user"
)
```

</td><td>

```go
import (
  userrepo "XXX/repo/user"
  usersvc "XXX/svc/user"
  schemauser "XXX/schema/user"
)
```
</td>
</tr>
</tbody>
</table>

### Directory Names

Should equal the package name and take into account the context of the parent directory.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
package repo
// user/userrepo/repo.go
```

</td><td>

```go
package repo
// user/repo/repo.go
```
</td>
</tr>
</tbody>
</table>

### Filenames

Single short and concise abbreviated word. If this is not possible, then separate by an underscore to match the same convention as test filenames.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
// repository.go
// userRepo.go
```

</td><td>

```go
// repo.go
// user_repo.go
```
</td>
</tr>
</tbody>
</table>

Filenames **do not** need to match the folder name and should take into account the context of the parent directories.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
package repo
// repos/user_repo.go
```

</td><td>

```go
package repo
// repos/user.go
```
</td>
</tr>
</tbody>
</table>

### Variable Names

Single short and concise words using well-known abbreviations and mixed caps.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
var repository Repository
var repository_name string
```

</td><td>

```go
var repo Repo
var repoName string
```
</td>
</tr>
</tbody>
</table>

### Variable Declarations

There are a number of ways to declare variables in Go. As a result, it is better to stick to a convention.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
person := Person{}
var person = Person{Name: "TheGoDev"}
```

</td><td>

```go
var person Person
person := Person{Name: "TheGoDev"}
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
person := &Person{Name: "TheGoDev"}
ProcessPerson(person)
```

</td><td>

```go
person := Person{Name: "TheGoDev"}
ProcessPerson(&person)
```
</td>
</tr>
</tbody>
</table>

### Function Names

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

### Interface Names

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

### Map Names

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

### Health Check Names

Health Check packages and endpoints should end with a `z`. Google did this to avoid name clashes with their many existing packages, but the convention stuck.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
package health
// endpoint - /health/ready
```

</td><td>

```go
package healthz
// endpoint - healthz/readyz
```
</td>
</tr>
</tbody>
</table>

### Mock Package Names

Should have a suffix of `_mock` to follow the same convention as tests and to avoid accidental import by the main application.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
package repomock
package repoMock
package mock_repo
```

</td><td>

```go
package repo_mock

```
</td>
</tr>
</tbody>
</table>

## Guidelines

### Using Factory Functions

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

### Using Interface Factories

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

### Testing

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

## Optimisation

### Building Strings

Strings are immutable in Go. Therefore, constructing a string requires multiple memory reallocations. Instead, use `strings.Builder`.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
func greet(name string) string {
    greet := "Hello "
    if name != "" {
      greet += name
    } else {
      greet += "World"
    }
    greet += "!"
    return greet
}
```

</td><td>

```go
func greet(name string) string {
    var b strings.Builder
    b.WriteString("Hello ")
    
    if name != "" {
      b.WriteString(name)
    } else {
      b.WriteString("World")
    }
    b.WriteString("!")
    
    return b.String()
}
```
</td>
</tr>
</tbody>
</table>

### Maps

Set the capacity of a map if you know roughly what the size will be. This reduces the number of times Go has to reallocate memory.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
func hasDuplicates(items []string) bool {
    m := make(map[string]bool) // no capacity set
    for _, val := range items {
        if _, ok := m[val]; ok {
          return true
        }
        m[val] = true
    }
    return false
}
```

</td><td>

```go
func hasDuplicates(items []string) bool {
    m := make(map[string]bool, len(items)) // capacity set
    for _, val := range items {
        if _, ok := m[val]; ok {
          return true
        }
        m[val] = true
    }
    return false
}
```
</td>
</tr>
</tbody>
</table>

### Slices / Arrays

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

### Types

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

## References

- [Effective Go](https://go.dev/doc/effective_go)
- [Uber's Style Guide](https://github.com/uber-go/guide/blob/master/style.md)
- [Ardan Labs](https://www.ardanlabs.com/)
