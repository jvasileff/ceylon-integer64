import ceylon.random {
    randomLimits,
    Random,
    DefaultRandom
}
import ceylon.test {
    assertEquals
}
import ceylon.whole {
    Whole
}

import com.vasileff.ceylon.integer64 {
    integer64FromWhole,
    Integer64,
    integer64
}

Random random = DefaultRandom();

Integer64 generateInteger64(
        Integer bits,
        Boolean zero = true,
        Boolean randomSignBit = true,
        Boolean randomizeBits = true) {
    assert (1 <= bits <= 63);
    while (true) {
        value nBits =
                if (!randomizeBits)
                then bits
                else random.nextInteger(bits) + 1;
        variable Integer64 result;
        if (nBits <= randomLimits.maxBits) {
            assert (exists l = integer64(random.nextBits(nBits)));
            result = l;
        }
        else {
            assert (exists h = integer64(random.nextBits(nBits - randomLimits.maxBits)));
            assert (exists l = integer64(random.nextBits(randomLimits.maxBits)));
            result = h.leftLogicalShift(randomLimits.maxBits).and(l);
        }
        if (randomSignBit && random.nextBoolean()) {
            result = result.flip(63);
        }
        if (zero || !result.zero) {
            return result;
        }
    }
}

void runTests<Args, Result>(label, actual, expected, tests)
        given Args satisfies [Anything*] {
    String label;
    Result(*Args) actual;
    Result(*Args) expected;
    {Args*} tests;
    for (args in tests) {
        variable Result? actualResult = null;
        variable Throwable? actualThrowable = null;
        try {
            actualResult = actual(*args);
        } catch (Throwable t) {
            actualThrowable = t;
        }

        variable Result? expectedResult = null;
        variable Throwable? expectedThrowable = null;
        try {
            expectedResult = expected(*args);
        } catch (Throwable t) {
            expectedThrowable = t;
        }

        if (exists at = actualThrowable) {
            if (expectedThrowable exists) {
                continue;
            }
            print("exception calculating actual for ``args`` ``label``");
            throw at;
        } else if (exists et = expectedThrowable) {
            print("exception calculating expected for ``args`` ``label``");
            throw et;
        }

        assert (exists ar = actualResult, exists er = expectedResult);
        assertEquals(ar, er, "``args`` ``label``");
    }
}

Integer64 basicWW
        (Whole(Whole)(Whole) f)
        (Integer64 a, Integer64 b)
    =>  integer64FromWhole(f(a.whole)(b.whole));

Integer64 basicWI
        (Whole(Integer)(Whole) f)
        (Integer64 a, Integer b)
    =>  integer64FromWhole(f(a.whole)(b));
