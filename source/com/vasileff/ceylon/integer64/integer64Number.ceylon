import com.vasileff.ceylon.integer64.internal {
    Integer64Impl16, Integer64Impl64, realInts
}

shared
Integer64 integer64Number(Integer number)
    =>  if (realInts)
        then Integer64Impl64.ofInteger(number)
        else Integer64Impl16.ofInteger(number);