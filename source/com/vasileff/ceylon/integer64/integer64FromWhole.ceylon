import ceylon.whole {
    Whole
}
import com.vasileff.ceylon.integer64.internal {
    realInts,
    Integer64Impl64,
    Integer64Impl16
}

"The given [[Whole]] as an [[Integer64]] composed of the 64 least significant bits of the
 two's complement representation of the `Whole`.

 The sign of the returned `Integer64` may be different from the sign of the `Whole`."
shared
Integer64 integer64FromWhole(Whole whole)
    =>  if (realInts)
        then Integer64Impl64.ofInteger(whole.integer)
        else Integer64Impl16.ofWhole(whole);
