#import "//template.typ": * // Import of all templating content

= Math

== Typst Basic Math
Math in Typst, is pretty similar to the way it's done in LaTeX. Here are some basic equations.

The sum of the numbers from $1$ to $n$ is:

$ sum_(k=1)^n k = (n(n+1))/2 $

This math isn't centered:

// No spaces around the $-signs
$x=123+123$

This is:

#figure(
  rect[$ delta "if" x <= 5 $],
  caption: [This is an equation as a figure *with* a border]
) <math:borderedEquation>

#figure(
  [$ f(x) = (x + 1) / x $],
  caption: [This is an equation as a figure *without* a border]
) <math:simpleEquation>

The math in @math:simpleEquation is referenced right here.

=== Matrices

This is an example of a matrix:
$ mat(
  1, 2, ..., 10;
  2, 2, ..., 10;
  dots.v, dots.v, dots.down, dots.v;
  10, 10, ..., 10;
) $

== Math for LaTeX Math Wizards
If you are used to LaTeX math, like the very handsome developer writing this, the `mitex` package has been included in the template. This allows for inline and display math using latex syntax.

=== Inline Math
Using the command `#mi` allows for inline equations such as #mi[`\sum_{a\in A}^i`]. The following shows how it was written:
```typ
#mi(`\sum_{a\in A}^i`)

or

#mi[`\sum_{a\in A}^i`]

```
The backtics in the braces are important.

=== Display Math
Using the command `#mitex` allows for inline equations such as: 

#mitex[`
(\text{call}_{\text{BS}}) 
\frac{
\begin{align*}
&\sigma \circ \mathcal{E}\vdash e_{1}\to_{exp}v_{1}\quad\dots\quad\sigma \circ \mathcal{E}\vdash e_{k}\to_{exp}v_{k}\\
&\pi''=\pi'[p_{name}\mapsto (S,[x_{1},\dots,x_{k}])]\\
&\mathcal{E}'[x_{1}\mapsto loc_{1},\dots,x_{1}\mapsto loc_{k}], \\
&\pi''\vdash_{nxt(loc)} \langle S, \sigma[loc_{1}\mapsto v_{1},\dots,loc_{k}\mapsto v_{k}]\rangle\to \sigma^{'},\\
&\pi(p_{name})=(S,[x_{1},\dots,x_{k}],\mathcal{E}',\pi' )
\end{align*}
} 
{\mathcal{E},\pi \vdash_{loc}\langle p_{name}\ ( \ e_{1},\dots,e_{k} \ ); \sigma \rangle \to_{stm} \sigma^{'}}
`]

The following shows how it was written:

```typ
#mitex[`
(\text{call}_{\text{BS}}) 
\frac{
\begin{align*}
&\sigma \circ \mathcal{E}\vdash e_{1}\to_{exp}v_{1}\quad\dots\quad\sigma \circ \mathcal{E}\vdash e_{k}\to_{exp}v_{k}\\
&\pi''=\pi'[p_{name}\mapsto (S,[x_{1},\dots,x_{k}])]\\
&\mathcal{E}'[x_{1}\mapsto loc_{1},\dots,x_{1}\mapsto loc_{k}], \\
&\pi''\vdash_{nxt(loc)} \langle S, \sigma[loc_{1}\mapsto v_{1},\dots,loc_{k}\mapsto v_{k}]\rangle\to \sigma^{'},\\
&\pi(p_{name})=(S,[x_{1},\dots,x_{k}],\mathcal{E}',\pi' )
\end{align*}
} 
{\mathcal{E},\pi \vdash_{loc}\langle p_{name}\ ( \ e_{1},\dots,e_{k} \ ); \sigma \rangle \to_{stm} \sigma^{'}}
`]
```

The backtics in the braces are important, and yes, that math is over the top.