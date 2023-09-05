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
