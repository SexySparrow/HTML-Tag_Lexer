# HTML-Tag_Lexer - Faculty Assignment
The project was made on Windows using WLS

## Functionality:
---
### IGNOR:
Status for ignored tag values beginning with `<!` and `<?`

### TAG:
Calculates the indentation for each tag.
If the tag is not followed by a closing element `>` it goes to the ATTRIBUTE state

### ATTRIBUTE:
The attributes and values are displayed using as separator `::` and `:` according to the rules,
in the case of several attributes it is used `;` for parting.

### CLOSE:
Performs parting with; between several attributes in the same TAG.

## Running the project:
`make build` - compiles the theme and creates the themeB executable

`make test1` - running example 1 (input-a.html)

`make test2` - running example 2 (input-b.html)

`make test3` - running example 3 (input-c.html)

`make test4` - running example 4 (input-d.html)

`make test5` - running example 5 (e-entry.html)

`make clean` - delete build-generated files
