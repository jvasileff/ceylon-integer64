import com.vasileff.ceylon.integer64 {
    integer64Number,
    Integer64
}

shared
Boolean realInts
    =   //false && runtime.integerAddressableSize == 64;
        runtime.integerAddressableSize == 64;

// These are used for Integer64.offset, so integerAddressableSize is irrelevant
Integer64 integerMax = integer64Number(runtime.maxIntegerValue);
Integer64 integerMin = integer64Number(runtime.minIntegerValue);
