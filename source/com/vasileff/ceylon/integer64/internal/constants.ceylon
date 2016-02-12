import com.vasileff.ceylon.integer64 {
    Integer64
}

shared
Boolean realInts
    =   //false && runtime.integerAddressableSize == 64;
        runtime.integerAddressableSize == 64;

// These are used for Integer64.offset, so integerAddressableSize is irrelevant
Integer64 integerMax = assertedInteger64(runtime.maxIntegerValue);
Integer64 integerMin = assertedInteger64(runtime.minIntegerValue);


