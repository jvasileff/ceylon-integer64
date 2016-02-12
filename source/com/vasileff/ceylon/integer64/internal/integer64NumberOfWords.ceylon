
import com.vasileff.ceylon.integer64 {
    Integer64
}

shared
Integer64 integer64NumberOfWords(
            Integer w3, Integer w2,
            Integer w1, Integer w0)
    =>  if (realInts)
        then Integer64Impl64.ofWords(w3, w2, w1, w0)
        else Integer64Impl16.ofWords(w3, w2, w1, w0);
