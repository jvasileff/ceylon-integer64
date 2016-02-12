import com.vasileff.ceylon.integer64 {
    Integer64
}

"The [[integer]] as an [[Integer64]]. This function throws if [[integer]] is outside of
 the min/max integer range on the current runtime."
shared
Integer64 assertedInteger64(Integer integer)
    =>  if (realInts)
        then Integer64Impl64.ofInteger(integer)
        else Integer64Impl16.ofInteger(integer);