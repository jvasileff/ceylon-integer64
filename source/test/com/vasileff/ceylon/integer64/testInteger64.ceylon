import ceylon.test {
    test,
    assertTrue,
    assertEquals,
    assertThatException
}

import com.vasileff.ceylon.integer64 {
    Integer64,
    integer64,
    parseInteger64,
    two,
    one,
    ten,
    zero
}

Integer64 num(String | Integer n) {
    assert (exists result
        =   switch (n)
            case (is Integer) integer64(n)
            case (is String) parseInteger64(n));
    return result;
}

test shared
void numbers() {
    Object? obj(Object? x) { return x; }
    assertTrue(obj(num(1)+num(1))  is Integer64, "natural addition");
    assertTrue(obj(num(1)-num(2))  is Integer64, "natural subtraction");
    assertTrue(obj(+num(1)+num(1)) is Integer64, "integer addition");
    assertTrue(obj(+num(1)-num(2)) is Integer64, "integer subtraction");

    assertTrue(num(1).negated==-num(1), "natural negative");
    assertTrue(-num(1).negated==+num(1), "integer negative");

    assertTrue(num(12).string=="12", "natural string 12");
    assertTrue(num(-12).string=="-12", "integer string -12");

    assertTrue(num(1).unit, "natural unit");
    assertTrue(!num(2).unit, "natural unit");
    assertTrue(num(0).zero, "natural zero");
    assertTrue(!num(1).zero, "natural zero");
    assertTrue(num(2).successor==num(3), "natural successor");
    assertTrue(num(2).predecessor==num(1), "natural predecessor");
    assertTrue((+num(1)).unit, "integer unit");
    assertTrue(!(num(-1)).unit, "integer unit");
    assertTrue((+num(0)).zero, "integer zero");
    assertTrue(!(+(num(1))).zero, "integer zero");
    assertTrue((num(-2)).successor==num(-1), "integer successor");
    assertTrue((num(-2)).predecessor==num(-3), "integer predecessor");

    assertTrue(num(2).fractionalPart==num(0), "natural fractional");
    assertTrue(num(-1).fractionalPart==num(0), "integer fractional");
    assertTrue(num(2).wholePart==num(2), "natural fractional");
    assertTrue(num(-1).wholePart==num(-1), "integer fractional");

    assertTrue(num(7).remainder(num(3))==num(1), "7 remainder 3");
    assertTrue(num(-7).remainder(num(3))==num(-1), "-7 remainder 3");
    assertTrue(num(7).modulo(num(3))==num(1), "7 modulo 3");
    assertTrue(num(-7).modulo(num(3))==num(2), "-7 modulo 3");
    try {
        num(7).modulo(num(-3));
        assertTrue(false, "modulo assertion");
    } catch (AssertionError x) {
        assertTrue(true, "modulo assertion");
    }

    assertTrue(num(+2).sign==+1, "integer sign");
    assertTrue(num(-3).sign==-1, "integer sign");

    function add<T>(T x, T y)
            given T satisfies Numeric<T> {
        return x.plus(y);
    }
    function exp<T>(T x, T y)
            given T satisfies Exponentiable<T,T> {
        return x.power(y);
    }

    function addIntegers(Integer64 x, Integer64 y) {
        return x+y;
    }
    function multiplyIntegerByInteger(Integer64 x, Integer64 y) {
        return x*y;
    }

    assertTrue(add(num(1),num(2))==num(3), "add(1,2)==3");
    assertTrue(add(-num(1),+num(2))==+num(1), "add(-1,+2)==+1");

    assertTrue(exp(num(2),num(2))==num(4), "exp(2,2)==4");
    assertTrue(exp(num(1),num(2))==num(1), "exp(1,2)==1");
    assertTrue(exp(num(0),num(2))==num(0), "exp(0,2)==0");
    assertTrue(exp(num(-1),num(2))==num(1), "exp(-1,2)==1");
    assertTrue(exp(num(-2),num(2))==num(4), "exp(-2,2)==4");

    assertTrue(exp(num(2),num(1))==num(2), "exp(2,1)==2");
    assertTrue(exp(num(1),num(1))==num(1), "exp(1,1)==1");
    assertTrue(exp(num(0),num(1))==num(0), "exp(0,1)==0");
    assertTrue(exp(num(-1),num(1))==num(-1), "exp(-1,1)==-1");
    assertTrue(exp(num(-2),num(1))==num(-2), "exp(-2,1)==-2");

    assertTrue(exp(num(2),num(0))==num(1), "exp(2,0)==2");
    assertTrue(exp(num(1),num(0))==num(1), "exp(1,0)==1");
    assertTrue(exp(num(0),num(0))==num(1), "exp(0,0)==0");
    assertTrue(exp(num(-1),num(0))==num(1), "exp(-1,0)==-1");
    assertTrue(exp(num(-2),num(0))==num(1), "exp(-2,0)==-2");


    assertThatException(()=>exp(num(2),num(-1)));
    assertTrue(exp(1,-1)==1, "exp(1,-1)==1");
    assertThatException(()=>exp(num(0),num(-1)));
    assertTrue(exp(-1,-1)==-1, "exp(-1,-1)==-1");
    assertThatException(()=>exp(num(-2),num(-1)));
    assertThatException(()=>exp(num(2),num(-2)));
    assertTrue(exp(1,-2)==1, "exp(1,-2)==1");
    assertThatException(()=>exp(num(0),num(-2)));
    assertTrue(exp(-1,-2)==1, "exp(-1,-2)==1");
    assertThatException(()=>exp(num(-2),num(-2)));

    Integer64 twoToPowerTen = num(2)*num(2)*num(2)*num(2)*num(2)*num(2)*num(2)*num(2)*num(2)*num(2);
    assertTrue(exp(num(2),num(10))==twoToPowerTen, "exp(2,10)==twoToPowerTen");
    assertTrue(exp(num(2),num(20))==twoToPowerTen*twoToPowerTen, "exp(2,30)==twoToPowerTen*twoToPowerTen");
    assertTrue(exp(num(2),num(30))==twoToPowerTen*twoToPowerTen*twoToPowerTen, "exp(2,30)==twoToPowerTen*twoToPowerTen*twoToPowerTen");

    assertTrue(addIntegers(num(2), num(4))==num(6), "addIntegers(2, 4)==6");
    assertTrue(addIntegers(num(-2), num(-4))==num(-6), "addIntegers(-2, -4)==-6");

    assertTrue(multiplyIntegerByInteger(num(1), num(-1))==num(-1), "multiplyIntegerByInteger(1, -1)==-1");

    assertTrue(num(1).hash==((num(3)-num(1))/num(2)).hash, "natural hash");
    assertTrue(num(1).hash!=num(-1).hash, "natural hash inverted not same");
    assertTrue(+num(0).hash==((num(-1)+num(+1))*num(+100)).hash, "integer hash");

    assertTrue(num(2).float==2.0, "integer float");
    assertTrue(num(-3).float==-3.0, "negative integer float");
    assertTrue(num(2).nearestFloat==2.0, "small integer nearestFloat");
    assertTrue(num(-3).nearestFloat==-3.0, "small negative integer nearestFloat");

    assertTrue(num("922337203685477632").nearestFloat == 9.2233720368547763E17, "large nearest float 1");
    assertTrue(-num("922337203685477632").nearestFloat == -9.2233720368547763E17, "large negative nearest float");
    assertTrue(num("922337203685477635").nearestFloat == 9.2233720368547763E17, "large nearest float 2");

    // TODO more tests from language/test/numbers.ceylon
}
