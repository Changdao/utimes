package com.utimes.study.fee;

import java.util.ArrayList;
import java.util.List;

/**
  SchoolFeeStrategy is the top level class to manipulate the School Fee.
 */
public class SchoolFeeStrategy {
    private List<SchoolFeeCategory> categories;

    public SchoolFeeStrategy()
    {
        this.categories =new ArrayList<SchoolFeeCategory>();
    }

    public void addCategory(SchoolFeeCategory category)
    {
        this.categories.add(category);
    }

    public SchoolFeeCategory getCategory(int idx)
    {
        return categories.get(idx);
    }
}
