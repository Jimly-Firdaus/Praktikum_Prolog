/*Untuk File .pl*/

/* Bagian 1 (Fakta, Rule, dan Query) */
/* Deklarasi Fakta */
/* Gender */
pria(gede).
pria(gojo).
pria(von_neumann).
pria(van_rossum).
pria(bambang).
pria(patrick).
pria(wesly).
pria(elon_musk).
pria(vito).
pria(ave).
wanita(khelli).
wanita(lovelace).
wanita(indah).
wanita(power).
wanita(aqua).
wanita(wulandari).
wanita(anya).

/* Usia */
usia(van_rossum, 65).
usia(indah, 92).
usia(von_neumann, 92).
usia(lovelace, 79).
usia(gede, 96).
usia(gojo, 90).
usia(bambang, 60).
usia(khelli, 89).
usia(vito, 56).
usia(power, 50).
usia(ave, 54).
usia(aqua, 50).
usia(wulandari, 24).
usia(wesly, 26).
usia(elon_musk, 28).
usia(patrick, 24).
usia(anya, 4).

/* Menikah */
menikah(gede, indah).
menikah(indah, gede).
menikah(gojo, lovelace).
menikah(lovelace, gojo).
menikah(khelli, von_neumann).
menikah(von_neumann, khelli).
menikah(vito, power).
menikah(power, vito).
menikah(ave, aqua).
menikah(aqua, ave).
menikah(wulandari, wesly).
menikah(wesly, wulandari).

/* Anak */
anak(van_rossum, gede).
anak(van_rossum, indah).
anak(bambang, gede).
anak(vito, gede).
anak(bambang, indah).
anak(vito, indah).
anak(power, gojo).
anak(power, lovelace).
anak(ave, gojo).
anak(ave, lovelace).
anak(aqua, khelli).
anak(aqua, von_neumann).
anak(wesly, vito).
anak(wesly, power).
anak(elon_musk, ave).
anak(elon_musk, aqua).
anak(patrick, ave).
anak(patrick, aqua).
anak(anya, wulandari).
anak(anya, wesly).

/* Saudara */
saudara(van_rossum, bambang).
saudara(van_rossum, vito).
saudara(bambang, van_rossum).
saudara(bambang, vito).
saudara(vito, bambang).
saudara(vito, van_rossum).
saudara(power, ave).
saudara(ave, power).
saudara(elon_musk, patrick).
saudara(patrick, elon_musk).

/* Deklarasi Rules */
kakak(X, Y) :- usia(X, A), usia(Y, B), (A > B), saudara(X, Y).
keponakan(X, Y) :- menikah(A, B), anak(X, A), anak(X, B), saudara(Y, A).
suami(X, Y) :- menikah(X, Y), pria(X).
sepupu(X, Y) :- anak(Y, A), anak(X, B), saudara(A, B).
menantu(X, Y) :- anak(Z, Y), menikah(X, Z).
orangtua(X, Y) :- anak(Y, X).
bibi(X, Y) :- anak(Y, A), saudara(A, X), wanita(X).
cucu(X, Y) :- anak(X, A), anak(A, Y).
keturunan(X, Y) :- orangtua(Y, X).
keturunan(X, Y) :- orangtua(A, X), keturunan(A, Y).
anaksulung(X) :- \+kakak(_, X). 
anakbungsu(X) :- \+kakak(X, _).

/* ------------------------------------------------- */
/* Bagian 2 (Rekursivitas) */
/* Deklarasi Fakta */

/* Deklarasi Rules */
/* combination(N, C, X) */
/* base case factorial */
factorial(0, 1).
factorial(N, Ans) :- 
    N > 0, 
    Next is (N-1), 
    factorial(Next, Res),
    Ans is (Res*N).

combination(N, C, X) :-     
    factorial(N, Res1),
    Num is Res1,
    factorial(N - C, Res2),
    factorial(C, Res3),
    Denum is Res2*Res3,
    X is (Num / Denum).

/* change(X, Y) */
substract(0, _, 0).
substract(A, B, X):-
    A >= B,
    X is (A-B).

inc(I, X):-
    X is I + 1.
/* base case */
change(0, 0).
/* case >= 5 */
change(X, Y) :-
    Y >= 5,
    substract(Y, 5, Res1),
    change(I, Res1),
    inc(I, X),
    !.
/* case >= 2 & < 5 */
change(X, Y) :-
    Y >= 2,
    substract(Y, 2, Res1),
    change(I, Res1),
    inc(I, X),
    !.
/* case == 1 */
change(X, Y) :-
    Y >= 1,
    substract(Y, 1, Res1),
    change(I, Res1),
    inc(I, X),
    !.

/* fpb(A, B, X) */
/* base case */
fpb(X, 0, X).
/* switch if B > A */
fpb(A, B, X):-
    B > A,
    fpb(B, A, X),
    !.
fpb(A, B, X):-
    A >= B,
    Res1 is A-(B*(A//B)),
    Multiplier is B,
    fpb(Multiplier, Res1, Ans),
    X is Ans.

/* mod(A, B, X) */
mod(0,_,0).
mod(A, B, X):-
    A < B,
    X is A.
mod(A, B, X):-
    A >= B,
    substract(A, B, Res1),
    mod(Res1, B, Ans),
    X is Ans.

/* deret(X, Y) */
/* base case */
deret(1, 1).
/* check X if divisble by 2 then + 1, else * 2 */
deret(X, Y):-
    mod(X, 2, Validate),
    Validate =:= 0,
    X1 is X - 1,
    deret(X1, Res1),
    Y is Res1 + 1.
deret(X, Y):-
    mod(X, 2, Validate),
    Validate =\= 0,
    X1 is X - 1,
    deret(X1, Res1),
    Y is Res1 * 2.

/* ------------------------------------------------- */
/* Bagian 3 (List) */
/* Deklarasi Fakta */

/* Deklarasi Rules */
/* min(List, Min) */
/* if 1 element */
min([X|[]], X).
/* else, check (setting next head = Min), Min < next Min then cut*/
min([Min|Y], Min):-
    min(Y, Temp),    
    Min < Temp,
    !.
/* next */
min([_X|Y], Min):-
    min(Y, Min).

/* max(List, Max) */
/* if 1 element */
max([X|[]], X).
/* else check */
max([Max|Y], Max):-
    max(Y, Temp),
    Max > Temp,
    !.
/* next */
max([_X|Y], Max):-
    max(Y, Max).

/* range(List, Range) */
range([_X|[]], 0).
range([_X|Y], Range):-
    max([_X|Y], Max),
    min([_X|Y], Min),
    Range is Max - Min.

/* count(List, Count) */
count([_X|[]], 1).
count([_X|Y], Count):-
    count(Y, Ans),
    Count is Ans + 1.

/* sum(List, Count) */
sum([X|[]], X).
sum([X|Y], Sum):-
    sum(Y, Temp),
    Sum is Temp + X.

/* getIndex(List, SearchedElement, Result) */
getIndex([X|Y], X, 1):-
    !.
getIndex([_X|Y], Num, Index):-
    getIndex(Y, Num, Ans),
    Index is Ans + 1.

/* swap(List, Index1, Index2, Result) */
/* mencari val dari index */
getVal([X|_], 1, X).
getVal([X|Y], Idx, Res) :-
    Idx1 is Idx - 1,
    getVal(Y, Idx1, Temp),
    Res is Temp.
/* mengubah X sekarang menjadi el-index-2 */
change([X|Y], 1, Val, [Val|Y]) :- 
    !.
change([X|Y], Index1, Val, [X|Ans]) :- 
    Index2 is Index1-1,
    change(Y, Index2, Val, Ans).

swap([X|Y], Index1, Index2, Result):-
    getVal([X|Y], Index1, El1),
    getVal([X|Y], Index2, El2),
    change([X|Y], Index1, El2, List),
    change(List, Index2, El1, Result).
    
/* splitList(ListAwal, ListGanjil, ListGenap) */ 
splitList([], [], []).
splitList([X|Y], [X|Ganjil], Genap):-
    mod(X, 2, Ans),
    Ans =:= 1,
    splitList(Y, Ganjil, Genap),
    !.
splitList([X|Y], Ganjil, [X|Genap]):-
    mod(X, 2, Ans),
    Ans =:= 0,
    splitList(Y, Ganjil, Genap),
    !.

/* ------------------------------------------------- */
/* Bagian 4 (Bonus) */
/* Deklarasi Fakta */

/* Deklarasi Rules */
:- dynamic(current_Val/1).
startCalculator :- 
    asserta(current_Val(0)),
    write('Selamat Datang di Kalkulator Prolog!'), nl,
    write('Currently Saved Value is '),
    current_Val(X),
    write(X).
add(Y) :-
    current_Val(X),
    AddRes is X + Y,
    write('Old Saved Value is '),
    write(X), nl,
    retractall(current_Val(X)),
    assertz(current_Val(AddRes)),
    write('New Saved Value is '),
    write(AddRes).
subtract(Y) :-
    current_Val(X),
    SubRes is X - Y,
    write('Old Saved Value is '),
    write(X), nl,
    retractall(current_Val(X)),
    assertz(current_Val(SubRes)),
    write('New Saved Value is '),
    write(SubRes).
multiply(Y) :-
    current_Val(X),
    MulRes is X * Y,
    write('Old Saved Value is '),
    write(X), nl,
    retractall(current_Val(X)),
    assertz(current_Val(MulRes)),
    write('New Saved Value is '),
    write(MulRes).
divide(Y) :-
    current_Val(X),
    DivRes is X / Y,
    write('Old Saved Value is '),
    write(X), nl,
    retractall(current_Val(X)),
    assertz(current_Val(DivRes)),
    write('New Saved Value is '),
    write(DivRes).
getValue :- 
    current_Val(X),
    write('Currently Saved Value is '),
    write(X).
clearCalculator :-
    current_Val(X),
    write('Old Saved Value is '),
    write(X), nl,
    retractall(current_Val(X)),
    asserta(current_Val(0)),
    current_Val(Y),
    write('New Saved Value is '),
    write(Y).
exitCalculator :-
    retractall(current_Val(0)),
    write('Terima Kasih telah Menggunakan Kalkulator Prolog.').