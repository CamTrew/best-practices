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
