import com.vasileff.ceylon.integer64.internal {
    Integer64Impl64
}

"The string representation of the given [[Integer64]] in the
 base given by [[radix]]. If the given value is negative,
 the string representation will begin with `-`. Digits
 consist of decimal digits `0` to `9`, together with and
 lowercase letters `a` to `z` for bases greater than 10."
throws (`class AssertionError`,
        "if [[radix]] is not between [[minRadix]] and
         [[maxRadix]]")
see (`function parseInteger64`)
shared
String formatInteger64(
        "The Integer64 value to format."
        Integer64 integer,
        "The base, between [[minRadix]] and [[maxRadix]]
         inclusive."
        Integer radix = 10) {

    if (is Integer64Impl64 integer) {
        return formatInteger(integer.integer, radix);
    }

    assert (minRadix <= radix <= maxRadix);
    if (integer.zero) {
        return "0";
    }
    assert (exists lRadix = integer64(radix));
    variable {Character*} digits = {};
    variable Integer64 i = if (integer < zero)
                      then integer
                      else -integer;
    while (!i.zero) {
        Integer64 dl = -(i % lRadix);
        Integer d = dl.integer;
        Character c;
        if (0 <= d < 10) {
            c = (d + zeroInt).character;
        }
        else if (10 <= d <36) {
            c = (d - 10 + aIntLower).character;
        }
        else {
            assert (false);
        }
        digits = digits.follow(c);
        i = (i + dl) / lRadix;
    }
    if (integer.negative) {
        digits = digits.follow('-');
    }
    return String(digits);
}
