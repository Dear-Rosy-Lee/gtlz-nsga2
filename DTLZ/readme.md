## DTLZ2

![image-20241210120956938](https://gitee.com/Dear-Rosy-Lee/picto-typora/raw/master/img/2024-12-10_12-09-59.png)

$$
\left\{
\begin{aligned}
\text{Min. } f_1(\mathbf{x}) &= (1 + g(\mathbf{x}_M)) \cos(x_1 \pi / 2) \cdots \cos(x_{M-2} \pi / 2) \cos(x_{M-1} \pi / 2) \\
\text{Min. } f_2(\mathbf{x}) &= (1 + g(\mathbf{x}_M)) \cos(x_1 \pi / 2) \cdots \cos(x_{M-2} \pi / 2) \sin(x_{M-1} \pi / 2) \\
\text{Min. } f_3(\mathbf{x}) &= (1 + g(\mathbf{x}_M)) \cos(x_1 \pi / 2) \cdots \sin(x_{M-2} \pi / 2) \\
&\vdots \\
\text{Min. } f_M(\mathbf{x}) &= (1 + g(\mathbf{x}_M)) \sin(x_1 \pi / 2)
\end{aligned}
\right.
$$

其中:

$$
g(\mathbf{x}_M) = \sum_{x_i \in \mathbf{x}_M} (x_i - 0.5)^2
$$

约束条件:

$$
0 \leq x_i \leq 1, \quad \text{for } i = 1, 2, \ldots, n
$$

## DTLZ5

![image-20241210121034373](https://gitee.com/Dear-Rosy-Lee/picto-typora/raw/master/img/2024-12-10_12-10-40.png)

$$
\left\{
\begin{aligned}
\text{Min. } f_1(\mathbf{x}) &= (1 + g(\mathbf{x}_M)) \cos(\theta_1 \pi / 2) \cdots \cos(\theta_{M-2} \pi / 2) \cos(\theta_{M-1} \pi / 2) \\
\text{Min. } f_2(\mathbf{x}) &= (1 + g(\mathbf{x}_M)) \cos(\theta_1 \pi / 2) \cdots \cos(\theta_{M-2} \pi / 2) \sin(\theta_{M-1} \pi / 2) \\
\text{Min. } f_3(\mathbf{x}) &= (1 + g(\mathbf{x}_M)) \cos(\theta_1 \pi / 2) \cdots \sin(\theta_{M-2} \pi / 2) \\
&\vdots \\
\text{Min. } f_M(\mathbf{x}) &= (1 + g(\mathbf{x}_M)) \sin(\theta_1 \pi / 2)
\end{aligned}
\right.
$$

其中:
$$
\theta_i = \frac{\pi}{4(1+g(\mathbf{x}_M))}(1 + 2g(\mathbf{x}_M)x_i), \quad \text{for } i = 2,3,\ldots,(M-1)
$$

$$
g(\mathbf{x}_M) = \sum_{x_i \in \mathbf{x}_M} (x_i - 0.5)^2
$$

约束条件:

$$
0 \leq x_i \leq 1, \quad \text{for } i = 1, 2, \ldots, n
$$

## DTLZ7

![image-20241210121108870](https://gitee.com/Dear-Rosy-Lee/picto-typora/raw/master/img/2024-12-10_12-11-10.png)

$$
\left\{
\begin{aligned}
\text{Min. } f_1(\mathbf{x}) &= x_1 \\
\text{Min. } f_2(\mathbf{x}) &= x_2 \\
&\vdots \\
\text{Min. } f_{M-1}(\mathbf{x}) &= x_{M-1} \\
\text{Min. } f_M(\mathbf{x}) &= (1 + g(\mathbf{x}_M))h(f_1,f_2,\ldots,f_{M-1},g)
\end{aligned}
\right.
$$

其中:

$$
g(\mathbf{x}_M) = 1 + \frac{9}{|\mathbf{x}_M|} \sum_{x_i \in \mathbf{x}_M} x_i
$$

$$
h(f_1,f_2,\ldots,f_{M-1},g) = M - \sum_{i=1}^{M-1} \left[\frac{f_i}{1+g}(1+\sin(3\pi f_i))\right]
$$

约束条件:

$$
0 \leq x_i \leq 1, \quad \text{for } i = 1, 2, \ldots, n
$$
$\bar{x}$