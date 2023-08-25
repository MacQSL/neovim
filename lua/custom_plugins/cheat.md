/*
 * Yes, you can use [conditional type
 * inference](https:www.typescriptlang.org/docs/handbook/2/conditional-
 * types.html#inferring-within-conditional-types) on the function type,
 * in a way very similar to how [the `Parameters` utility
 * type](https:www.typescriptlang.org/docs/handbook/utility-
 * types.html#parameterstype) [is implemented](https:github.com/microso
 * ft/TypeScript/blob/87c5b6a752f8ac3239ac05fbcbbb889dc7c0019d/lib/lib.es
 * 5.d.ts#L1523-L1526):
 * 
 * ```ts
 * type ParametersExceptFirst<F> =
 */
F extends (arg0: any, ...rest: infer R) => any ? R : never;
/*
 * ```
 * 
 * compare to
 * 
 * ```ts
 * from lib.es5.d.ts
 * type Parameters<T extends (...args: any) => any> =
 *   T extends (...args: infer P) => any ? P : never;
 * ```
 * 
 * and verify that it works:
 * 
 * ```ts
 * declare function foo(x: string, y: number, z: boolean): Date;
 * type FooParamsExceptFirst = ParametersExceptFirst<typeof foo>;
 * type FooParamsExceptFirst = [y: number, z: boolean]
 * declare function foo(x: string, y: number, z: boolean): Date;
 * ```
 * 
 * [Playground link to code](https:www.typescriptlang.org/play?#code/FA
 * FwngDgpgBACgQwE4ILZRFJBnAogDwGMoIQAxASxxAB4yA+GAXhjJin0wDsATbGABTIA5gA
 * YAXDARcwAGhgA6JUijYQkilwBmWGACUAlM0bSwMAPz6YkrlABuWANzBgPKIQA2yWFoCuXQ
 * hAKAHsuGC1g4IF8STUkTWF5MBtfVAAjLHkAL0k0yI8oaQNJABEETGdwaFZIxBRUPCIScio
 * 1ZnhkNAwsRuJSSmoaKqhgrXDI+mcAeimYYZrgurRe5oG2lgBtZJguVIykbNz8wq4AXSA)
 * 
 * ---
 * 
 * **UPDATE:** arbitrary slicing of tuples with numeric literals is
 * possible, but not pretty and has caveats.  First let's write
 * `TupleSplit<T, N>` which takes a tuple `T` and a numeric
 * [literal](https:www.typescriptlang.org/docs/handbook/2/everyday-
 * types.html#literal-types) type `N`, and splits the tuple `T` at index
 * `N`, returning two pieces: the first piece is the first `N` elements
 * of `T`, and the second piece is everything after that.  (If `N` is
 * more than the length of `T` then the first piece is all of `T` and the
 * second piece is empty):
 */

 type TupleSplit<T, N extends number, O extends readonly any[] = readonly []> =
     O['length'] extends N ? [O, T] : T extends readonly [infer F, ...infer R] ?
     TupleSplit<readonly [...R], N, readonly [...O, F]> : [O, T]

/*
 * This works via [recursive conditional
 * types](https:www.typescriptlang.org/docs/handbook/release-
 * notes/typescript-4-1.html#recursive-conditional-types) on [variadic
 * tuples](https:www.typescriptlang.org/docs/handbook/release-
 * notes/typescript-4-0.html#variadic-tuple-types) and is therefore more
 * computationally intensive than the relatively simple
 * `ParametersExceptFirst` implementation above.  If you try this on long
 * tuples (lengths more than 25 or so) you can expect to see recursion
 * errors.  If you try this on ill-behaved types like non-fixed-length
 * tuples or unions of things, you might get weird results.  It's
 * fragile; be careful with it.
 * 
 * Let's verify that it works:
 */

 type Test = TupleSplit<readonly ["a", "b", "c", "d", "e"], 3>
 // type Test = [readonly ["a", "b", "c"], readonly ["d", "e"]]

/*
 * Looks good.
 * 
 * ---
 * 
 * Now we can use `TupleSplit<T, N>` to implement `TakeFirst<T, N>`,
 * returning just the first `N` elements of `T`, and `SkipFirst<T, N>`,
 * which skips the first `N` elements of `T`:
 */

 type TakeFirst<T extends readonly any[], N extends number> =
     TupleSplit<T, N>[0];

 type SkipFirst<T extends readonly any[], N extends number> =
     TupleSplit<T, N>[1];

/*
 * And finally `TupleSlice<T, S, E>` produces the slice of tuple `T` from
 * start position `S` to end position `E` (remember, slices are inclusive
 * of the start index, and exclusive of the end index) by taking the
 * first `E` elements of `T` and skipping the first `S` elements of the
 * result:
 */

 type TupleSlice<T extends readonly any[], S extends number, E extends number> =
     SkipFirst<TakeFirst<T, E>, S>

/*
 * ---
 * 
 * To demonstrate that this more or less represents what array `slice()`
 * does, let's write a function and test it:
 */

 function slice<T extends readonly any[], S extends number, E extends number>(
     arr: readonly [...T], start: S, end: E
 ) {
     return arr.slice(start, end) as readonly any[] as TupleSlice<T, S, E>;
 }

 const tuple = ["a", "b", "c", "d", "e"] as const
 // const tuple: readonly ["a", "b", "c", "d", "e"]

 const ret0 = slice(tuple, 2, 4);
 // const ret0: readonly ["c", "d"]
 console.log(ret0); // ["c", "d"]

 const ret1 = slice(tuple, 0, 9);
 // const ret1: readonly ["a", "b", "c", "d", "e"]
 console.log(ret1); // ["a", "b", "c", "d", "e"];

 const ret2 = slice(tuple, 5, 3);
 // const ret2: readonly []
 console.log(ret2); // [];

/*
 * This looks good; the returned arrays from `slice()` have types that
 * accurately represent their values.
 * 
 * Of course, there are many caveats; if you pass negative or non-whole
 * numbers to `slice()` for `S` and `E`, then `TupleSlice<T, S, E>` is
 * very likely not to correspond to what actually happens with array
 * slices: negative "from end" behavior is possibly implementable but it
 * would be even uglier; non-whole numbers or even just `number` have not
 * been tested but I expect recursion warnings and other things that go
 * bump in the night.  Be warned!
 * 
 * [Playground link to code](https:www.typescriptlang.org/play?#code/C4
 * TwDgpgBAKgrmANhAykglsAPDANFAOSggA9gIA7AEwGcoK4BbAIwgCd8B5Ysy2qNhACGVAP
 * YVEIKEIogA2gF0oAXgHCxEqYoB8KgFBRDUTnIDkyCgHNgAC1NLS5anSIB+KHM74YSgFywe
 * J35BEXFJD3QKADN2KAAxfAA6ZMiYtigAJSVXAyN4JFQMbBCNcLlkxKz8AnwSsK0Kr3iFXX
 * 9PbwU9PVBIWAgaYBVYBGQ0REwsOs0PACIhGfwZ5gWoGYBjFZmqTYgZhXwAZm09AHoTqB7o
 * GH7B1TkpsrnN5cWN-bVQ6bktnb3O7vAVyEAGsIHF0GwBjhAnw6A8pDJ5O8iI5YfQmKw2Lp
 * lLlDPlRkUcNVtHIAAwKADcXUuUBQwPQYHBkOwMBhzg+pQRskU1TZ-AYLHY2NxwwKYwmeEI
 * JIAjJTqYDRaNxmsINDUez4dJue8UHy6ALMfgAKJ69GCrH6Iy0+mMiFQmAgsF2lnG7T4FDH
 * PRROAUNbAdDiKA0ZWq1nq4LqepapHu00G9jGuMYoUAChFQjYbH8mvKyR8+AGGeA-hQ+D4-
 * iNegAlFAAN4iwTAOBsCjSTOJYPoFUpwtsYBl6g1oRwyPTRGKaR0fGoENE2muqkAXy6a3EA
 * wuI2gdyeixeqw2i22i12SmHUFXFAGp3OF-XTYK2dHj3mu82B9WR9WJ5Xa8GjdJQydt297I
 * PgABM+AACxVlSZznr+ajAKSj6fI874-J0t6iMgiSIKIlgpv+MFQHB3zods-y3n+EDANKgE
 * himIEQPgpL4AAnDB17wZe1G0ShnKzC+qx7usmyfjM35YTheEEY20rEaRO7CW+Ym-HKehUY
 * hYH0V2ECMZu+AAKyHJxcGaY2YH8VGigaWu2EQLh+GETRYEKecihUl0ZlCAAbsIwA0CWWpU
 * FAJo2CIUCsMA5DpKw9DiAAtBQECWEI-p+VAADuNj2WamJ0MgNB0LYMhtqIPohWBhlQKI6Q
 * 0KI+C1VAIDlVl6CIIgQYQNA6BFXA-R6EAA)
 * 
 * [jcalz] [so/q/67605122] [cc by-sa 3.0]
 */
