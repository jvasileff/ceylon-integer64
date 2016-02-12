import ceylon.whole {
    Whole,
    wholeNumber
}
import com.vasileff.ceylon.integer64 {
    Integer64,
    lzero=zero
}

shared
class Integer64Impl64 satisfies Integer64 {

    shared actual
    Integer integer;

    shared
    new ofInteger(Integer integer) {
        this.integer = integer;
    }

    shared
    new ofWords(Integer w3, Integer w2, Integer w1, Integer w0) {
        integer = w0.or(w1.leftLogicalShift(16))
                    .or(w2.leftLogicalShift(32))
                    .or(w3.leftLogicalShift(48));
    }

    shared actual
    Integer64 and(Integer64 other) {
        assert(is Integer64Impl64 other);
        return ofInteger(integer.and(other.integer));
    }

    shared actual
    Comparison compare(Integer64 other) {
        assert(is Integer64Impl64 other);
        return integer.compare(other.integer);
    }

    shared actual
    Integer64 divided(Integer64 other) {
        assert(is Integer64Impl64 other);
        return ofInteger(integer.divided(other.integer));
    }

    shared actual
    Integer64 flip(Integer index)
        =>  ofInteger(integer.flip(index));

    shared actual
    Boolean get(Integer index)
        =>  integer.get(index);

    shared actual
    Integer64 leftLogicalShift(Integer shift)
        =>  ofInteger(integer.leftLogicalShift(shift));

    shared actual
    Integer64 neighbour(Integer offset)
        =>  ofInteger(integer.neighbour(offset));

    shared actual
    Integer offset(Integer64 other) {
        assert(is Integer64Impl64 other);
        return integer.offset(other.integer);
    }

    shared actual
    Integer64 or(Integer64 other) {
        assert(is Integer64Impl64 other);
        return ofInteger(integer.or(other.integer));
    }

    shared actual
    Integer64 plus(Integer64 other) {
        assert(is Integer64Impl64 other);
        return ofInteger(integer.plus(other.integer));
    }

    shared actual
    Integer64 plusInteger(Integer integer)
        =>  ofInteger(this.integer.plusInteger(integer));

    shared actual
    Integer64 power(Integer64 exponent) {
        assert(is Integer64Impl64 exponent);
        return ofInteger(integer.power(exponent.integer));
    }

    shared actual
    Integer64 powerOfInteger(Integer exponent)
        =>  ofInteger(integer.powerOfInteger(exponent));

    shared actual
    Integer64 remainder(Integer64 other) {
        assert(is Integer64Impl64 other);
        return ofInteger(integer.remainder(other.integer));
    }

    shared actual
    Integer64 rightArithmeticShift(Integer shift)
        =>  ofInteger(integer.rightArithmeticShift(shift));

    shared actual
    Integer64 rightLogicalShift(Integer shift)
        =>  ofInteger(integer.rightLogicalShift(shift));

    shared actual
    Integer64 set(Integer index, Boolean bit)
        =>  ofInteger(integer.set(index, bit));

    shared actual
    Integer64 times(Integer64 other) {
        assert(is Integer64Impl64 other);
        return ofInteger(integer.times(other.integer));
    }

    shared actual
    Integer64 timesInteger(Integer integer)
        =>  ofInteger(this.integer.timesInteger(integer));

    shared actual
    Integer64 xor(Integer64 other) {
        assert(is Integer64Impl64 other);
        return ofInteger(integer.xor(other.integer));
    }

    shared actual
    Boolean equals(Object that)
        =>  if (is Integer64Impl64 that)
            then integer == that.integer
            else false;

    shared actual
    Boolean unit => integer.unit;

    shared actual
    Integer64 fractionalPart => lzero;

    shared actual
    Integer64 wholePart => this;

    shared actual
    Boolean zero => integer.zero;

    shared actual
    String string => integer.string;

    shared actual
    Integer preciseInteger => integer;

    shared actual
    Integer impreciseInteger => integer;

    shared actual
    Integer hash => integer.hash;

    shared actual
    Whole whole => wholeNumber(integer);

    shared actual
    Integer64 negated => ofInteger(integer.negated);

    shared actual
    Integer64 not => ofInteger(integer.not);

    shared actual
    Boolean negative => integer.negative;

    shared actual
    Boolean positive => integer.positive;

    shared actual
    Boolean even => integer.even;

    shared actual
    Byte byte => integer.byte;

    shared actual
    Character character => integer.character;

    shared actual
    Float float => integer.float;
}
