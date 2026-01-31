#import "//template.typ": * // Import of all templating content

= Code <ch:code>

The easiest way to represent code in a document is using the native Typst functionality. It uses the exact same syntax as regular extended markdown.

This is an example of Nim.
```nim
proc fibonacci(n: int): int =
  if n < 2:
    result = n
  else:
    result = fibonacci(n - 1) + (n - 2).fibonacci
```

Below is an example of how to make it a figure.

#figure(
```nim
proc fibonacci(n: int): int =
  if n < 2:
    result = n
  else:
    result = fibonacci(n - 1) + (n - 2).fibonacci
```,
  caption: [The same snippet of Nim code, now as a figure#footnote([You will notice that Typst has automatically detected it as a Listing and is numbering it accordingly])]
) <lst:nim-snippet>


@lst:nim-snippet shows how to put a piece of code into a figure, and this text shows how to reference it.

You can also inline code: `echo "Hello Line!"`, ```nim echo "Hello Formatted Line!"```

== Line Numbers and Size of Code
So you want line numbers as well? This isn't natively supported. BUT FEAR NOT it is very possible! Below is an example of this, where the font size of the code also have been altered.

#figure(
  kind: raw,
  context[
  #show raw: set text(1.2em) // Changed the font size for this code snippit

  #show raw.line: it => {
    h(0em + if it.number < 10 { 0.6em })
    text(fill: gray)[#it.number]
    h(0.8em)
    it.body
  }
```nim
proc fibonacci(n: int): int =
  if n < 2:
    result = n
  else:
    result = fibonacci(n - 1) + (n - 2).fibonacci
```],
  caption: [Same pice of code as in @lst:nim-snippet but with line-numbers and a different font-size#footnote[Notice that `kind:raw` is added telling typst the figure is a listing, this is becuase the listing is in a `#context` block, and can therefore not automatically detect it as a listing. (raw = listings).]]
)
