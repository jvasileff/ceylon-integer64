import com.vasileff.ceylon.integer64 {
    Long
}
import ceylon.whole {
    Whole
}

shared
Long longNumberFromWhole(Whole whole)
    =>  if (realInts)
        then LongImpl64.ofInteger(whole.integer)
        else LongImpl16.ofWhole(whole);
