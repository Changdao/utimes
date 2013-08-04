package com.utimes.study.fee;

import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * User: nevernew
 * Date: 13-8-4
 * Time: 下午10:46
 * To change this template use File | Settings | File Templates.
 */
public class SchoolFeeCategory extends ArrayList {
    private String name;

    public SchoolFeeCategory(String name)
    {
        this.name=name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
