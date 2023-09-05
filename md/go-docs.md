The package's Go Doc comment should always use the format `/**/` over `//`.


<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
// Package handler contains all of the handlers for a user.
// These are the endpoints that are exposed to the client and are 
// responsible for parsing the request, calling the service, 
// and returning the response.
```

</td><td>

```go
/*
Package handler contains all of the handlers for a user.
These are the endpoints that are exposed to the client and are
responsible for parsing the request, calling the service, 
and returning the response.
*/
```
</td>
</tr>
</tbody>
</table>

The synopsis for a package should be high-level, short, and concise. We can go into detail later.

<table>
<thead><tr><th>Bad</th><th>Good</th></tr></thead>
<tbody>
<tr><td>

```go
/*
Package mongo is where the connection to Mongo is made 
and if there is no connection established, 
then we throw an error or retry multiple times to try and reconnect.
 */
```

</td><td>

```go
/*
Package mongo is the entry point for connecting to MongoDB.
If there is no connection established, 
then we throw an error or retry multiple times to try and reconnect.
*/
```
</td>
</tr>
</tbody>
</table>

Avoid mentioning specifics, these will quickly become out-of-date and often the available options can be seen from the functions or variables.

<table>
<thead><tr><th>Bad</th>
<tbody>
<tr><td>

```go
/*
	...
	The endpoints include:
	  - /hello
	  - /world
*/
```

</tr>
</tbody>
</table>
