package com.utimes.study.util;

/**
 *
 * User: nevernew
 * Date: 13-10-4
 * Time: 下午4:57
 * A simple 封装类 to avoid remove too many system.out or switch between different debug tool.
 */
public class Logger {
    private static final boolean debugFlag=true;
    public final static void debug(String str)
    {
        if(debugFlag)System.out.println("<DEBUG>"+str);
    }

}
