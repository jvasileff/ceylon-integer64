import ceylon.whole {
    Whole
}
import com.vasileff.ceylon.integer64.internal {
    realInts,
    Integer64Impl64,
    Integer64Impl16
}

shared
Integer64 integer64(Integer number)
    =>  if (realInts)
        then Integer64Impl64.ofInteger(number)
        else Integer64Impl16.ofInteger(number);

shared sealed
interface Integer64
        satisfies Integral<Integer64> &
                  Binary<Integer64> &
                  Exponentiable<Integer64, Integer64> {

    "An [[Integer]] composed of the [[runtime.integerAddressableSize]]
     number of least significant bits of the two's complement
     representation of this `Integer64`.

     For JavaScript, the sign of the returned [[Integer]] may be
     different from the sign of the `Integer64`."
    shared formal
    Integer integer;

    "An [[Integer]] with the same value as this `Integer64` if this
     `Integer64` is greater than or equal to [[runtime.minIntegerValue]]
     and less than or equal to [[runtime.maxIntegerValue]]. Otherwise, an
     [[OverflowException]] is thrown."
    throws(`class OverflowException`,
           "if this number cannot be represented by
            an [[Integer]] without loss of precision")
    shared formal
    Integer preciseInteger;

    "The number, as an [[Integer]], possibly with loss of precision."
    shared formal
    Integer nearestInteger;

    "True if this number is even.

     A number `n` is even if there exists an integer `k`
     such that:

         n == 2*k

     Thus, `n` is even if and only if `n%2 == 0`."
    shared formal
    Boolean even;

    "The number, as a [[Whole]]."
    shared formal
    Whole whole;

    "The UTF-32 character with this UCS code point."
    throws (`class OverflowException`,
            "if this integer is not in the range
             `0..#10FFFF` of legal Unicode code points")
    shared formal Character character;

    "The number, represented as a [[Float]], if such a
     representation is possible."
    throws (`class OverflowException`,
        "if the number cannot be represented as a `Float`
         without loss of precision")
    shared formal Float float;

    "The nearest [[Float]] to this number."
    shared formal Float nearestFloat;

    "A [[Byte]] whose [[signed|Byte.signed]] and
     [[unsigned|Byte.unsigned]] interpretations are
     congruent modulo 256 to this integer."
    shared formal Byte byte;
}
