# Disparate impact ratio

Similarly to the [Statistical Parity Difference](spd.md), *the Disparate Impact Ratio* (DIR) measures imbalances in positive outcome predictions across privileged and unprivileged groups.
Instead of calculating the difference, this metric calculates the ratio of such selection rates. Typically:

- $DIR=1$ means that the model is fair with regards to the protected attribute.
- $0.8<DIR<1.2$ means that the model is reasonably fair.

The formal definition of the Disparate Impact Ratio is:

$$
DIR=\frac{p(\hat{y}=1|D_u)}{p(\hat{y}=1|D_p)}
$$