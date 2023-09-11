Interfaces should be declared in the package they are used, not in the same package as the implementing struct. Only the package that uses the interface has knowledge of the required methods. Remember, you accept interfaces and return structs.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
package producer  
  
type Fooer interface {  
  Foo()  
  Bar()  
}  
  
type foo struct{}  
  
func (f *foo) Foo() {}  
  
func (f *foo) Bar() {}  
  
func New() Fooer { // Returning the interface.  
  return &foo{}  
}

- - - - - - - - -

package main  
  
import "XXX/producer"  
  
type app struct {  
  fooer producer.Fooer  
}  
  
func (a app) start() {  
  a.fooer.Foo()  
  // a.fooer.Bar() is available.
}  
  
func main() {  
  a := app{  
   fooer: producer.New(),  
  }  
  a.start()  
}
```

</td><td>

```go
package producer  
  
type foo struct{}  
  
func (f *foo) Foo() {}  
  
func (f *foo) Bar() {}  
  
func New() *foo {  
  return &foo{}  
}

- - - - - - - - -

package main  
  
import "XXX/producer"  
  
type fooer interface {  
  Foo() 
}  
  
type app struct {  
  fooer fooer  
}  
  
func (a app) start() {  
  a.fooer.Foo() 
  // We do not have access to Bar()
}  
  
func main() {  
  a := app{  
   fooer: producer.New(),  
  }  
  a.start()  
}
```
</td>
</tr>
</tbody>
</table>

Go interfaces are implemented implicitly which allows you to specify only the required methods, leading to a reduction in interface bloat. By returning a struct instead of an interface, we reduce preemptive interface creation too. Interfaces should only be created when they are needed.
