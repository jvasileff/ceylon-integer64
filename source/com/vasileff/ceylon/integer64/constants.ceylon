shared Integer64 zero = integer64Number(0);
shared Integer64 one = integer64Number(1);
shared Integer64 two = integer64Number(2);
shared Integer64 ten = integer64Number(10);

"The maximum [[Integer64]] value, equal to (2<sup>63</sup> - 1)."
shared
Integer64 maxInteger64Value
    =   integer64NumberOfWords(#7fff, #ffff, #ffff, #ffff);

"The minimum [[Integer64]] value, equal to -(2<sup>63</sup>)."
shared
Integer64 minInteger64Value
    =   integer64NumberOfWords(#8000, 0, 0, 0);
