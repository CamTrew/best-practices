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
