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
