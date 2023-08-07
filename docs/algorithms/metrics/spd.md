# Statistical Parity Difference

The *Statistical Parity Difference* (SPD)  is the difference in the probability of prediction between the privileged and unprivileged groups. Typically:

- $SPD=0$ means that the model is behaving fairly in regards of the selected attribute (*e.g.* race, gender)
- Values between $-0.1<SPD<0.1$ mean that the model is reasonably fair and the score can be attributed to other factors, such as sample size.
- An SPD outside this range would be an indicator of an unfair model relative to the protected attributes.
  - A negative value of statistical parity difference indicates that the unprivileged group is at a disadvantage
  - A positive value indicates that the privileged group is at a disadvantage.

The formal definition of SPD is

$$
SPD=p(\hat{y}=1|D_u)-p(\hat{y}=1|D_p)
$$

where $\hat{y}=1$ is the favourable outcome and $D_u$, $D_p$ are respectively the privileged and unprivileged group data.
