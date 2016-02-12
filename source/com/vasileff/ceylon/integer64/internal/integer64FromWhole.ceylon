import com.vasileff.ceylon.integer64 {
    Integer64
}
import ceylon.whole {
    Whole
}

shared
Integer64 integer64FromWhole(Whole whole)
    =>  if (realInts)
        then Integer64Impl64.ofInteger(whole.integer)
        else Integer64Impl16.ofWhole(whole);
