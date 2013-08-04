package com.utimes.study.fee;

/**
  SchoolFeeType is a type name to identify the Fee Item name.
  For different schools have different itmes, but most of them have the same name, as far as at most conditions, those have same meaning.
  Although those same items have different value or computing method, that's not responsibility of this Class.
 */
public class SchoolFeeType {
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
