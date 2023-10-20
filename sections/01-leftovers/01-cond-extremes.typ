#import "../../utils/core.typ": * 

== Условные экстремумы

#def[
  Пусть $f: D --> RR$ и $Phi: D --> RR^m$, $D subset RR^(n+m).$
  Пусть есть точка $a in D$, $Phi(a) = 0$. $Phi$ называется _условием связи_.

  Точка $a$ называется точкой _условного максимума_ при условии $Phi(x) = 0$ есть существует окрестность $U$ точки $a$, такая что $f(a) >= f(x)$ для любых $x in U$ для которых $Phi(x) = 0$.

  Аналогично, _строгого условного максимума_  при условии $Phi(x) = 0$ есть существует окрестность $U$ точки $a$, такая что $f(a) > f(x)$ для любых $x in U$ $(x != a)$ для которых $Phi(x) = 0$.

  Тоже самое для условных минимумов.

  $a$ --- _точка условного экстремума_, если $a$ --- точка условного максимума или условия минимума.
]

#pr(name: "Метод [неопределенных] множителей Лагранжа")[
  Пусть $f$ и $Phi$ --- дифференцируемы во внутренней точке $a$, $Phi$ --- непрерывно дифференцируема в окрестности $a$.

  Если $a$  --- точка условного экстремума при условии, что $Phi = 0$, то
  $ nabla f (a), nabla Phi_1 (a), ..., nabla Phi_m (a) $
  линейно зависимы.
]

#notice[
  1. Если $nabla Phi_1 (a), ..., nabla Phi_m (a)$ --- линейно зависимы, ничего утверждать нельзя.
  2. $nabla Phi_1 (a), ..., nabla Phi_m (a)$ --- строки матицы $Phi' (a)$, то есть они линейно назависимы iff $rk Phi' (a) = m$ (максимально возможный).
  3. Если $nabla Phi_1 (a), ..., nabla Phi_m (a)$ линейно независимы, а $nabla f (a), nabla Phi_1 (a), ..., nabla Phi_m (a)$ --- линейно зависимы, то $nabla f (a) = sum_(j = 1)^m lambda_j nabla Phi_j (a)$. Такие $lambda_j$ называются _множителями Лагранжа_.

    В векторном виде, можно сказать, что найдется вектор $lambda$, такой что $nabla f (a) = lambda Phi' (a)$
]

#proof[
  Считаем, что определитель по последним $m$ столбцам $Phi' (a)$ не $0$. \ Скажем, что $a = (b, c)$, где $b in RR^n$, $c in RR^m$ и $x = (y, z)$, где $y in RR^n$, $z in RR^m$.
  
  Для определенности, считаем $a$ точкой условного максимума.

  По теореме о неявной функции существуют $W$ --- окрестность $b$ и $g: W --> RR^m$, непрерывно дифференцируемая, такие, что $Phi(y, g(y)) = 0$ для любого $y in W$.

  Определим $h(y) = f(y, g(y))$. Имеем право выбрать $W$ так, чтобы образ этой окрестности попадал в $U$ (уменьшая окрестность). Если $y in W$, то $(y, g(y)) in U$ и $Phi(y, g(y)) = 0$. Значит $h(b) = f(a) >= f(y, g(y)) = h(y)$, то есть $b$ --- точка локального максимума для $h$ (обычного, не условного). С этим мы уже знакомы, и у нас есть необходимое условие локального максимума --- $h'(b) = 0$.

  Тогда $h'(y) = f'(y, g(y)) dot mat(E; g'(y)) = f'_y (y, g(y)) + f'_z (y, g(y)) g'_y = f'_y (a) + f'_z (a) g'(b)$. Здесь, например, $f_y$ означает что от $f$ остались только первые столбцы, в той же размерности что и $y$, а остальное занулилось (кажется, double check).

  Знаем, что $Phi(y, g(y)) equiv 0$, значит $Phi'(y, g(y)) equiv 0$, а
  $
    Phi'(y, g(y)) = Phi'_y (a) + Phi'_z (a) g'(b) ==> Phi'_y (a) + Phi'_z (a) g'(b) = 0.
  $

  Возьмем (пока произвольную) $lambda$ и поймем, что 
  $
    0 = f'_y (a) + f'_z (a) g'(b) - lambda Phi'_y (a) - lambda Phi'_z (a) g'(b) = (f'_y (a) - lambda Phi'_y (a)) + (f'_z (a) - lambda Phi'_z (a)) g'(b)
  $
  Так как $Phi'_z (a)$ невырожденная, можно подобрать такое $lambda$, что $f'_z (a) = lambda Phi'_z (a)$, поэтому $f'_y (a) = lambda Phi'_y (a) ==> nabla f(a) = lambda nabla Phi(a)$
]

#notice[
  $a in RR^(n + m)$, $lambda in RR^m$. У нас имеется $n + 2m$ неизвестных, в уравнении $nabla f(a) = lambda nabla Phi(a)$ ($n + m$ уравнений) и еще $Phi(a) = 0$ ($m$ уравнений). По этому, по крайней мере, из соображений размерности, теорема имеет смысл.
]

// Базисы грёбнера
// хз что это, но звучит прикольно, оставлю коммент.

#example[
  Найдем наибольшее и наименьшее значение квадратичной формы на сфере ($Q(x) = dotp(A x, x)$). $A$ --- симметричная матрица $A = A^T$. Пусть $Phi = dotp(x, x) - 1$.

  $Phi(x) = 0$ --- задает сферу --- компакт, --- поэтому наибольшее и наименьшее значения сущесвуют.

  $nabla Phi(x) = 2x$, ранг при этом максимальный, $rk Phi'(x) = 1$.

  Решим $nabla Q(a) = lambda nabla Phi(a)$, где $lambda in RR$. 
  
  $ 
    Q(x) &= sum_(i, j = 1)^n a_(i j) x_i x_j \
    (diff Q) / (diff x_k) &= 2 a_(k k) x_k + sum_(i != k) a_(i k) x_i + sum_(j != k) a_(k j) x_j = \
    & #h(1cm) = 2 a_(k k) x_k + 2 sum_(j != k) a_(k j) x_i = 2 sum_(j = 1)^n a_(k j) x_i = (2 A x)_k \ ==> nabla Q(x) &= 2 A x ==> cancel(2) A x = lambda cancel(2) x.
  $

  Значит $lambda$ --- собственное число матрицы $A$, а $x$ --- единичный собственный вектор матрицы $A$.

  Пусть $x$ --- единичный собственный вектор матрицы $A$, тогда 
  $
    Q(x) = dotp(A x, x) = dotp(lambda x, x) = lambda dotp(x, x) = lambda.
  $

  Доказали теорему:
]

#th[
  Наибольшее (наименьшее) значение квадратичной формы на единичной сфере --- наибольшее (наименьшее) собственное число матрицы, и оно достигается на соотствующем единичном векторе.
]

#follow[
  $A$ --- произвольная матрица. $A: RR^n --> R^m$. В $RR^m$ и $RR^n$ стандартные нормы.

  $ 
    norm(A) = max { sqrt(lambda) bar lambda thin #[--- собственные числа матрицы] A^T A }. 
  $
]

#proof[
  $norm(A) = sup_(norm(x) = 1) norm(A x)^2$,
  посмотрим на $ norm(A x)^2 = dotp(A x, A x) = (A x)^T (A x) = x^T A^T A x = x^T dot (A^T A x) = dotp(A^T A x, x) =: Q(x). $
]