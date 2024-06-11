#import "../../utils/core.typ": *

== Производящие функции

#remind(name: "произведение рядов")[
    Если $A(z) = sum_(n = 0)^oo a_n z^n$, и $B(z) = sum_(n = 0)^oo b_n z^n$. Тогда
    $
        A(z) B(z) = sum_(n = 0)^oo c_n z^n, "где" c_n = a_0 b_n + a_1 b_(n-1) + a_2 b_(n-2) + ... + a_n b_0.
    $
    $c_n$ --- свертка последовательностей $a_n$ и $b_n$.
]

#def[
    Если $a_n$ --- последовательность ответов, то можно записать следующую функцию, которая называется _производящей функцией последовательности_:
    $ A(z) = sum_(n = 0)^oo a_n z^n. $
    Естественно, мы хотим чтобы у этой функции был хоть какой-то радиус сходиомости, то есть чтобы коэффициенты не росли быстрее чем $O(n^c)$.
]

#example(name: "Задача о размене")[
    Пусть у нас есть монетки номиналом $1$, $2$, $5$, и $10$, в неограниченом количестве. Сколькими способами можно разменять $n$ монеток?
    Рассмотрим функцию,
    $
        A(z) = (1+z+z^2&+z^3+...) (1+z^2+z^4+z^6+...) \
        &(1+z^5+z^10+z^15+...) (1+z^10+z^20+z^30+...),
    $
    Тогда коэффициент при $z^n$ равен количеству способов разменять $n$ монеток, или количетсво способов представить $n$ в виде $a + 2b + 5c + 10d$. Можно свернуть геометрические прогрессии:
    $
        A(z) = 1/(1-z) dot 1/(1-z^2) dot 1/(1-z^5) dot 1/(1-z^10).
    $
]

#def[
    Пусть $H subset NN$. Обозначим $p(n, H)$ --- количество способов представить $n$ в виде суммы элементов из $H$.
]

#notice[
    $
        sum_(n = 0)^oo p(n, H) z^n = product_(k in H) 1/(1 - z^k).
    $
]

#notice[
    Если на каждое слагаемое есть ограничение на количество слагаемых ($<= r$ раз, скажем), то
    $
        Ff(z) = product_(k in H) (1 + z^k + ... + z^(k r)) = product_(k in H) (1 - z^((r+1)k)) / (1 - z^k).
    $
]

#def[
    $p(n)$ --- число разбиений, то есть $p(n, NN)$.
]

#notice(name: "теорема Харди-Рамануджана")[
    $p(n) sim 1/(4n sqrt(3)) e^(pi sqrt(2/3) sqrt(n))$. Очев#footnote[нет].
]

#th(name: "Эйлера")[
    Число разбиений $n$ на нечетные слагаемые равно числу разбиений $n$ на различные слагаемые.
]

#proof[
    Число разбиений числа на нечетные слагаемые равно
    $
        Aa(z) =
        product_(n = 1)^oo 1/(1-z^(2n - 1)) =
        product_(n = 1)^oo (1-z^(2n))/(1-z^n).
    $
    Последнее равенство верно, так как в знаменателе у нас произведения по всем $n$, а в числителе только по чётным, поэтому в итоге в знаменателе остаётся только произведение по нечётным. Теперь раскроем числитель каждого множителя как разность квадратов и получим
    $
        product_(n = 1)^oo (1-z^(2n))/(1-z^n) =
        product_(n = 1)^oo ((cancel(1-z^n))(1 + z^n))/(cancel(1-z^n)) =
        product_(n = 1)^oo (1 + z^n),
    $
    а это число разбиений на различные слагаемые (каждое слагаемое берём не более $1$-го раза).
]

#exercise[
    Придумать явную биекцию.
]

#example(name: "диагонализация степенных рядов")[
    Пусть имеется
    $ 
        F(z, w) = sum_(n,m = 0)^oo a_(n m) z^n w^m,
    $
    который сходится при $abs(z) < R$ и $abs(w) < R$. Хотим придумать производящую функцию для диагонали $a_(n n)$, то есть $sum_(n = 0)^oo a_(n n) z^n$.

    Такая производящая функция по двум переменным зачастую пишется намного проще, чем по одной. Например, для биномиальных коэффициентов:
    $
        sum_(n, m = 0)^oo C_(n + m)^n z^n w^m = sum_(k = 0)^oo underbrace(sum_(n = 0)^k C_k^n z^n w^(k - n), (z+w)^k) = sum_(k = 0)^oo (z + w)^k = 1/(1 - z - w).
    $
    При $abs(z), abs(w) < 1/2$ ряд сходится. Попробуем его диагонализировать:
    $
        F(z, w/z) = sum_(m, n)^oo a_(n m) z^n w^m z^(-m).
    $
    В таком ряде коэффициент перед $z^0$ это $sum_(m = 0)^oo a_(m m) w^m$. А мы умеем находить такой коэффициент по теореме Коши:
    $
        1/(2pi i) integral_(abs(z) = r) F(z, w/z) (dif z)/z =
        1/(2pi i) integral_(abs(z) = r) sum_(m, n = 0)^oo a_(n m) w^m z^(n - m - 1) dif z.
    $
    Здесь мы рассмотрели маленькое $r$ ($0 < r < R$, $abs(w)/r = abs(w/z) = R$), поэтому, так как мы внутри круга сходимости, есть равномерная сходимость:
    $
        1/(2pi i) integral_(abs(z) = r) sum_(m, n = 0)^oo a_(n m) w^m z^(n - m - 1) dif z =
        1/(2pi i) sum_(m, n = 0)^oo a_(n m) w^m underbrace(integral_(abs(z) = r) z^(n - m - 1) dif z, 0 "при" n != m\,\ 2pi i "при" n = m) =
        sum_(m = 0)^oo a_(m m) w^m.
    $

    Возвращаемся к нашему примеру.
    $
        1/(2pi i) integral_(abs(z) = r) F(z, w/z) (dif z)/z =
        1/(2pi i) integral_(abs(z) = r) 1/(1-z-w/z) (dif z)/z =
        1/(2pi i) integral_(abs(z) = r) (dif z)/(-z^2 + z - w) = sum res.
    $
    Где у этой функции вычеты? Когда обнуляется знаменатель, то есть
    $
        z^2 - z + w = 0 ==> z = (1 plus.minus sqrt(1 - 4w))/2.
    $
    Корень со знаком "$+$" нас не интересует, потому что он не попадает в круг маленького радиуса, да и вообще в нем исходный ряд расходится. Значит
    $
        sum res =
        res_(z = (1 - sqrt(1 - 4w))/2 ) =
        lr(1/(-z^2 + z - w)' |)_(z = (1 - sqrt(1 - 4w))/2) =
        lr(1/(-2z + 1) |)_(z = (1 - sqrt(1 - 4w))/2) =
        1/sqrt(1 - 4w).
    $
    Получается,
    $
        sum_(n = 0)^oo C_(2n)^n w^n = 1/sqrt(1 - 4w).
    $
]

#example(name: "произведение Адамара")[
    Пусть есть две производящие функции $Aa(z) = sum_(n = 0)^oo a_n z^n$ и $Bb(z) = sum_(n = 0)^oo b_n z^n$. Хотим найти _произведение Адамара_ --- производящую функцию
    $
        Aa dot.circle Bb = sum_(n = 0)^oo a_n b_n z^n.
    $

    Как его искать? Через тот же метод с диагонализацией. Рассматриваем
    $
        Ff(z, w) = Aa(z) Bb(z) = sum_(n,m=0)^oo a_n b_m z^n w^m
    $
    и нужно найти "диагональ" $sum_(n = 0)^oo a_n b_n w^n$.
]


#def[
    Последовательность $a_n$ назовем _квазимногочленом_ (или _квазиполиномом_), если $a_n = p_1 (n) q_1^n + p_2 (n) q_2^n + ... + p_k (n) q_k^n$, где $p_1$, $p_2$, ..., $p_k$ --- многочлены, а $q_1, q_2, ..., q_k in RR$ различные числа.
]

#lemma[
    Производящая функция рациональна тогда и только тогда, когда последовательность --- квазимногочлен.
]

#proof[
    - "$==>$": $Aa(z)$ --- рациональная, значит ее можно представить как линейную комбинацию простейших (вида $1/(z - a)^k$). Надо научиться раскладывать ее
        $
            1/(z - a)^k = (-1)^k/(1 - z/a)^k dot (1/a)^k = (-1/a)^k dot sum_(n = 0)^oo (k^overline(n) z^n)/(a^n n!),
        $
        Коэффициент перед $z^n$:
        $
            (-1/a)^k dot (k (k + 1) ... (k + n - 1))/(a^n n!) =
            C_(k + n - 1)^(k - 1) dot (-1/a)^k dot 1/a^n =
            C_(k + n - 1)^n dot (-1/a)^k dot 1/a^n newline(=)
            ((k + n - 1)(k + n - 2)...(n + 1))/(k-1)! dot (-1/a)^k dot 1/a^n.
        $
        Это квазимногочлен. Значит каждая простейшая раскладывается в квазимногочлен, и их линейная комбинация тоже.
    - "$<==$": Достаточно понять для одного "коэффициента", $a_n = p(n) q^n$. Представим многочлен в виде
        $
            p(n) = c_k dot (n + k) (n + k - 1)...(n + 1) + c_(k - 1) dot (n + k - 1) (n + k - 2)...(n + 1) + ... + c_0.
        $
        Тогда достаточно понять для
        $
            b_n = (n + k) (n + k - 1) ... (n + 1) q^(n + k),
        $
        для $k = 0$, $a_n = q^n$ и 
        $
            1/(1 - q z) = sum_(n = 0) q^n z^n,
        $
        а чтобы получить остальные коэффициенты, надо продифференцировать:
        $
            (1/(1 - q z))' = sum_(n = 0)^oo n q^n z^(n - 1) = sum_(n = 0)^oo (n + 1) q^(n + 1) z^n.
        $
]

#th[
    Произведение Адамара рациональных функций --- рациональная функция.
]

#proof[
    $Aa, Bb$ --- рациональные, значит $a_n$, $b_n$ --- квазимногочлены, значит $a_n b_n$ --- квазимногочлен, значит $Aa dot.circle Bb$ рациональная.
]

#example(name: "метод Дарбу")[
    Наша цель: оценивать скорость роста коэффициентов производящих функций.
    
    Пусть имеется фукнция $f(z) = sum_(n = 0)^oo a_n z^n$, $R$ --- конечный радиус сходимости (если коэффициенты ряда убывают так быстро, что радиус сходимости бесконечность, вряд ли такой ряд нужен в комбинаторике, где обычно последовательности целочислены). Тогда на границе круга сходимости есть особая точка.

    План такой: давайте вычтем из функции главную часть ряда Лорана в этой точке. В точке появится голоморфность. Будем продолжать так делать, пока все изолированные особые точки на границе круга сходимости не исчезнут (тут приходится просто надеятся, что они изолированы, и что их конечное количество). После этого радиус сходимости увеличивается. Разложив в нем функцию в ряд Тейлора, можно оценить скорость роста коэффициентов исходной функции, пользуясь скоростью роста коэффициентов разложения главных частей ряда Лорана. Сейчас на примере будет понятнее.

    Рассмотрим функцию (положим $f(0) = +sqrt(2) > 0$):
    $
        f(z) = sqrt(2 - z)/(1 - z)^2.
    $
    Особая точка на границе круга сходимости одна: $z = 1$, и это полюс второго порядка. Чтобы "погасить" эту особенность, надо вычесть главную часть ряда Лорана в этой точке. Она равна
    $
        1/(1 - z)^2 - 1/(2(1 - z)) =: g(z),
    $
    что получается разложением числителя в ряд по степеням $(1 - z)$.

    Тогда
    $
        f(z) - g(z) = sqrt(2 - z)/(1 - z)^2 - 1/(1-z)^2 + 1/(2(1 - z)) = sum_(n = 0)^oo b_n z^n
    $
    голоморфна в $z = 1$, и радиус сходимости расширяется до $2$ (точка ветвления $sqrt(2 - z)$).

    Значит $b_n = o((2 - eps)^(-n))$. А коэффициенты $g(z)$ мы знаем, найдем и вычтем их:
    $
        1/(1 - z)^2 = sum_(n = 0)^oo (n + 1)z^n, quad
        1/(1 - z) = sum_(n = 0)^oo z^n.
    $
    а тогда
    $
        a_n = (n + 1) - 1/2 + b_n = n + 1/2 + o((1/(2 - eps))^n).
    $
    Вот и оценка на коэффициенты. В простых случаях (когда на границе круга сходимости конечное число *изолированных* особых точек) такой метод работает.
]

#example[
    Рассмотрим
    $ f(z) = e^z/sqrt(1 - z) = sum_(n = 0)^oo a_n z^n. $
    Радиус сходимости у этой функции равен $1$, но теперь на границе точка ветвления $z = 1$. Однако мы можем эту особенность "улучшить". Вычтем из функции $e/sqrt(1 - z)$:
    $
        f(z) - e/sqrt(1 - z) = (e^z - e)/sqrt(1 - z) = sum_(n = 0)^oo b_n z^n.
    $
    Теперь если разложить числитель в ряд в 1, получится, что функция ведет себя как $O(sqrt(1-z))$:
    $
        f(z) - e/sqrt(1 - z) = e dot (e^(z - 1) - 1)/(sqrt(1 - z)) = e dot (sum_(k = 1)^oo 1/k! (z - 1)^k)/(sqrt(1 - z)).
    $
    Не достаточно мало, чтобы прямо сказать асимптотику, как в прошлом примере, но зато хоть как-то стремиться к нулю.
    Тогда, разложив $1/sqrt(1 - z)$ в ряд,
    $
        a_n = b_n + e dot (1/2)^overline(n)/n!.
    $
    Оценим последний ряд:
    $
        (1/2 dot 3/2 dot ... dot (1/2 + n - 1))/n! =
        ((2n - 1) dot (2n - 3) dot ... dot 1)/(2^n dot n!) =
        (2n)!/((2n)!! dot n! dot 2^n) =
        (2n)!/(4^n (n!)^2) = C_(2n)^n/4^n sim 1/sqrt(pi n).
    $
    Можно проверить, что $b_n = O(1/(n sqrt(n)))$, и наша оценка на ряд совпадает с оценкой на $a_n$, то есть $a_n sim 1/sqrt(pi n)$. Здесь у нас не получилось найти скорость роста точнее, но придется довольствоваться чем имеем.
]

#notice[
    Полезный факт. Если $f in H(abs(z) < R)$, $R > 1$, $f(1) != 0$, $alpha != 0, -1, -2, ...$. Тогда коэффициент $f(z)/(1 - z)^alpha$ эквиватентен $f(1) dot binom(n + alpha -  1, n)$.
]
