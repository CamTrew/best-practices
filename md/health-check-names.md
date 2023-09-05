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
