#import "../../utils/core.typ": *


== Интегралы с параметром

#def[
  Пусть $(X, Aa, mu)$ --- пространство с мерой. $T$ --- подмножество метрического пространства. $E_t in Aa$ и для любого $t in T$ функция $f: X times T --> overline(RR)$ с фиксированным $t$ измерима. Пусть $F (t) := integral_(E_t) f(x, y) dif mu(x). $ 
]

#notice[
  На зависимость от $E_t$ можно не обращать внимания:
  $ F(t) = integral_X f(x, t) bb(1)_(E_t) (x) dif mu(x) $
]

#(make_theorem("Вопросы, интересущие нас", color: purple))[
  + $t_0$ --- предельная точка $T$ и $f(x, t) -->_(t -> t_0) g(x)$. Верно ли, что $F$ имеет предел в $t_0$? Если да, то какой?
  + $f(x, t)$ непрерывна в точке $t_0$ для любого $x in X$. Верно ли, что $F$ непрерывна в $t_0$?
  + $T subset RR$. $f(x, t)$ дифференцируема по $t$ для любого $x in X$. Будет ли дифференциируема $F$? Если да, как считать производную?
  + Если $nu$ --- мера на $T$, что можно сказать про $integral_T F dif nu$?
]

#notice[
  На вопрос 4 мы отвечать уже научились неплохо.
  $ integral_T F dif nu = integral_T integral_X f(x, t) dif mu(x) dif nu(t). $
]

#th(name: "ответ на вопрос 1")[
  Пусть $t_0$ --- предельная точка. Суммируемая $f$ такова, что $f(x, t) -->_(t -> t_0) g(x)$ во всех $x in X$. Существует $Phi: X --> overline(RR)$ суммируемая, и окрестность $U_(t_0)$ такая, что $abs(f(x, t)) <= Phi(x)$ для любого $x$ и $t in U_(t_0)$. Тогда $ lim_(t -> t_0) integral_X f(x, t) dif mu(x) = integral_X g dif mu. $
]

#proof[
  Проверяем существование предела по Гейне. Рассмотрим $t_n -> t_0$. Обозначим $f_n (x) := f(x, t_n)$. Тогда при больших $n$ верно $t_n in U_(t_0)$, и можно применить теорему Лебега о предельном переходе: $abs(f_n (x)) <= Phi(x)$ для каждого $x$ начиная с некоторого $m$.  По теореме имеем, $lim integral_X f_n dif mu = integral_X g dif mu$.
]

Обобщим свойство, которым мы пользовались в теореме.

#def[
  Пусть $f: X times T --> overline(RR)$. Пусть $t_0$ --- предельная точка T. Будем говорить, что $f$ удовлетворяет _локальному условию Лебега_ в точке $t_0$, если существует суммируемая $Phi: X --> overline(RR)$ и окрестность $U_(t_0)$, такие, что $abs(f(x, t)) <= Phi(x) space forall x in X space forall t in U_(t_0)$.
]

#let converges = sym.arrows.rr

#def[
  Говорят, что $f(x, t) arrows.rr_(t -> t_0) g(x)$, или _$f$ равномерно сходится к $g$ на $X$ в точке $t_0$_ если
  $ forall eps > 0 space exists delta > 0 space forall x in X space forall t != t_0 space rho(t, t_0) < delta ==> abs(f(x, t) - g(x)) < eps. $
]

#notice[
  $ f(x, t) arrows.rr_(t -> t_0) g(x) "равномерно на" X <==> sup_(x in X) abs(f(x, t) - g(x)) -->_(t -> t_0) 0. $
]

#follow[
  Пусть $mu X < +oo$ и $f(x, t) converges_(t -> t_0) g(x)$ (где $f$ суммируема) равномерно на $X$. Тогда $g$ суммируема, и $ lim_(t -> t_0) integral_X f(x, t) dif mu(x) = integral_X g dif mu. $
]

#proof[
  Возьмем $eps = 1$, по нему $delta > 0$ из определения и пусть $rho(s, t_0) < delta$ ($s != t_0$). Тогда $abs(f(x, s) - g(x)) < 1$ для любого $x in X$, значит $abs(f(x, s)) < 1 + abs(g(x))$ --- суммируемая штука. Поэтому $abs(g(x)) + 1$ --- суммируемая мажоранта. Она подходит, так как при $eps < 1$, $abs(f(x, t) - g(x)) < eps < 1$ при $t$ близких к $t_0$, поэтому $abs(f(x, t)) <= abs(g(x)) + 1$, поэтому у нас есть локальное условие Лебега. Доказали.
]

#exercise[
  Доказать это напрямую.
]

#notice[
  Условие $mu X < +oo$ существенно. Пусть $X = RR$, $mu = lambda_1$. Если $f_n (x) = 1/n bb(1)_[0, n] (x) converges_(n -> oo) 0$. Но тогда $integral_RR f_n dif lambda_1 = 1 cancel(-->) 0 = integral_RR 0 dif lambda_1$.
]

#follow[
  Пусть $mu X < +oo$, $f(x, t)$ непрерывна по $t$ в точке $t_0$ для любого $x in X$, и удовлетворяет локальному условию Лебега в точке $t_0$. Тогда $F(t) := integral_X f(x, t) dif mu(x)$ непрерывна в точке $t_0$.
]

#proof[
  Очевидно по теореме.
]

#line(length: 100%)

#(make_theorem("Отступление", color: purple))[
  Пусть $(X, rho_X)$ и $(Y, rho_Y)$ --- метрические пространства. Можно определить $(X times Y, d)$, где $d((x, y), (x', y')) = rho_X (x, x') + rho_Y (y, y')$. Это тоже метрическое пространство. Можно брать сумму, максимум, корень из суммы квадратов --- не важно. Если операция адекватная, это все равно метрическое пространство.
]

#lemma[
  Пусть $K$ и $L$ компакты в $X$ и $Y$. Тогда $K times L$ --- компакт в $(X times Y, d)$.
]

#proof[
  Проверяем секвенциальную компактность. Берем $(x_n, y_n) in K times L$. $x_n in K$, значит найдется $x_(n_k)$ сходится к точке из $K$, и $y_(n_k) in L$, поэтому найдется $y_(n_(k_l))$, которая сходится к точке из $L$. Тогда $(x_(n_(k_l)), y_(n_(k_l)))$ сходится к точке из $K times L$. Доказали.
]

#line(length: 100%)

#th[
  Пусть $X$ и $T$ компакты, $mu X < +oo$ и $f in C(X times T)$. Тогда $F(t) := integral_X f(x, t) dif mu(x) in C(T)$.
]

#proof[
  $X times T$ компакт по лемме, непрерывная функция на компакте ограничена. Значит $abs(f(x, t)) <= M$ для любого $x in X$ и $t in T$. Нашли мажоранту. Подставляем в следствие, получаем что хотим.
]

#follow[
  От компактности $T$ можно отказаться. Пусть $X$ --- компакт, $mu X < +oo$, $Omega subset RR^m$ --- открыто. Пусть $f$ непрерывна на $X times Omega$. Тогда интегралы $F(t) := integral_X f(x, t) dif mu(x)$ будут непрерывны на $Omega$.
]

#proof[
  Возьмем точку из $Omega$ и будем проверять там непрерывность. Рассмотрим шарик $overline(B)_r (t_0)$, который вместе с замыканием будет содежраться в $Omega$. Это компактное множество. Рассмотрим $f bar_(X times overline(B)_r (t_0))$. Эта функция непрерывна. Можем подствавить сужение в теорему. Значит, $F bar_(overline(B)_r (t_0))$ непрерывна на шарике, значит $F$ непрерывна в $t_0$.
]

В основном именно последняя теорема и следсвие будут полезны на практике. Свойство локального условия Лебега довольно тяжело проверять.

#line(length: 100%)

Теперь углубимся в дифференцируемость.

#th[
  Пусть $f: X times T --> RR$ суммируема для любого $t in T$, пусть $T subset RR$ --- промежуток. Пусть $f'_t (x, t)$ удовлетворяет локальному условию Лебега в точке $t_0$. Тогда $F$ дифференцируема в точке $t_0$, и $F' (t_0) = integral_X f'_t (x, t_0) dif mu(x)$.
]

#proof[
  Пишем в лоб определение производной. Рассмотрим 
  $ (F(t_0 + h) - F(t_0)) / h = 1/h (integral_X f(x, t_0 + h) dif mu(x) - integral_X f(x, t_0) dif mu(x)) = \ = integral_X underbrace((f(x, t_0 + h) - f(x, t_0))/h, := g(x, h)) dif mu(x). $
  Надо понять, когда $integral_X g(x, h) dif mu(x) -->_(h -> 0) integral_X f'_t(x, t_0) dif mu(x)$. Мы знаем, что $g(x, h) -->_(h -> 0) f'_t(x, t_0)$, а когда можно переходить к интегралам? Когда выполняется Локальное условие Лебега для $g$ при $h$ близких к $0$. Проверяем его.
  $ 
    g(x, h) = (f(x, t_0 + h) - f(x, t_0)) / h = f'_t (x, t_0 + theta h),
  $
  где $theta = theta(x, h) in (0, 1)$. Тогда $abs(g(x, h)) = abs(f'_t (x, t_0 + theta h)) <= Phi(x)$ при $h$ близких к нулю ($t_0 + theta h in U_(t_0)$ --- мы попадаем в окрестность из условия). Получили локальное условие Лебега для $g$.
]

#follow[
  Пусть $mu X < +oo$, $T subset RR$ --- промежуток, $X$ --- компакт. Пусть $f in C(X times T)$ и $f'_t in C(X times T)$. Тогда $F in C^1 (T)$ и $F' (t) = integral_X f'_t (x, t) dif mu_(x)$.
]

#proof[
  Возьмем $t_0 in T$. Накроем ее каким-то компактным отрезком $[a, b]$. Так как $f'_t in C (X times [a, b])$, то $f$ ограничена (на компакте). А если $abs(f'_t) <= M$, мы нашли суммируемую мажоранту. Подставляем в теорему. $F$ дифференцируема в точке $t_0$, и $F' (t_0) = integral_X f'_t  (x, t_0) dif mu(x)$. Так как $t_0$ любая, мы проверили дифференцируемость во всех точках и формулу для производной. По прерыдущей теореме, функция $integral_X f'_t (x, t) dif mu(x)$, заданная на таком промежутке, будет непрерывна по $t$.
]

#let anyinterval(..smth) = $lr(angle.l #{smth.pos().join(",")} angle.r)$

#th(name: "формула Лейбница")[
  Пусть $f: anyinterval(a, b) times anyinterval(c, d) --> RR$, пусть $f, f'_t in C(anyinterval(a, b) times anyinterval(c, d))$. Пусть $phi, psi: anyinterval(c, d) --> anyinterval(a, b)$ непрерывно дифференрируемые. Тогда если
  $
    F(t) := integral_(phi(t))^(psi(t)) f(x, t) dif x in C^1(anyinterval(c, d)), 
  $
  то
  $
    F'(t) = integral_(phi(t))^(psi(t)) f'_t (x, t) dif x + f(psi(t), t) psi'(t) - f(phi(t), t) phi'(t).
  $

  Храбров сказал что это база какая-то. Надо это знать и уметь применять.
]
#proof[
  Пусть $g(alpha, beta, t) := integral_alpha^beta f(x, t) dif x$, где $alpha, beta in anyinterval(a, b)$, и $t in anyinterval(c, d)$. Тогда $g'_t (alpha, beta, t) = integral_alpha^beta f'_t (x, t) dif x$ из следствия, $g'_beta (alpha, beta, t) = f(beta, t)$, и $g'_alpha (alpha, beta, t) = -f(alpha, t)$. Все три производные непрерывны. Значит $g$ --- дифференцируемая, а $F(t) = g(phi(t), psi(t), t)$, то есть тоже дифференцируемая. Запишем производную композиции:
  $ F'(t) = g'_alpha (phi(t), psi(t), t) dot phi'(t) + g'_beta (phi(t), psi(t), t) psi'(t) + g'_t (phi(t), psi(t), t). $
  Что и требовалось.
]

#example[
  Посчитаем $F(t) = integral_0^(+oo) e^(-x^2) cos(x t) d x$. В лоб посчитать это не получится с нашими текущими знаниями, поэтому продифференцируем, и что-то поймем. Для начала в лоб,
  $ F'_t (t) = -integral_0^(+oo) e^(-x^2) x sin(x t) d x. $
  Правда, чтобы так делать, нужно локальное условие Лебега. Оно есть: $x e^(-x^2)$ суммируема, и не меньше подынтегральной функции. Кстати, так как под интегралом непрерывная функция, то $F'_t$ непрерывна.

  Итак, хотим посчитать
  $
    integral_0^(+oo) e^(-x^2) x sin(x t) d x.
  $
  Как обычно, когда ничего не понятно, интегрируем по частям. Пусть $v = e^(-x^2)$ ($dif v = -2 x e^(-x^2) dif x$), а $u = sin(x t)$ ($dif u = t cos (x t) dif x$). Тогда
  $
    underbrace(lr(1/2 e^(-x^2) sin (x t) |)_0^(+oo), 0) - integral_0^(+oo) 1/2 t e^(-x^2) cos (x t) d x = - t/2 F(t).
  $
  Получили уравнение $F'(t) + t/2 dot F(t) = 0$. Получили дифференциальное уравнение.
  $
    F'(t) + t/2 dot F(t) = 0 & <==> \ <==> (F(t) e^(t^2/4))' = e^(t^2/4) dot F'(t) + t/2 e^(t^2 / 4) dot F(t) = 0 & <==> \ <==> F(t) = C e^(-t^2/4)&.
  $
  Остается найти константу. Подставим $t = 0$, получим $F(0) = integral_0^(+oo) e^(-x^2) d x = sqrt(pi)/2$. Значит $C = sqrt(pi)/2$. Итого, $ F(t) = sqrt(pi)/2 e^(-t^2/4). $

  Вот так дифференцирование по параметру позволяет узнать что-то про интеграл.
]
