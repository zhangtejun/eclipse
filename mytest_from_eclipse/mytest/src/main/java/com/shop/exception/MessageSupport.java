package com.shop.exception;
public class MessageSupport
    implements Messageable
{

    public MessageSupport()
    {
        c = null;
        d = null;
        b = new Object[0];
    }

    public boolean hasDefaultMessage()
    {
        return c != null;
    }

    public void setDefaultMessage(String s)
    {
        c = s;
    }

    public String getDefaultMessage()
    {
        if(c == null)
            return null;
        else
            return c;
    }

    public void setMessageKey(String s)
    {
        d = s;
    }

    public String getMessageKey()
    {
        return d;
    }

    public void setArgs(Object aobj[])
    {
        b = aobj;
    }

    public Object[] getArgs()
    {
        return b;
    }

    private String c;
    private String d;
    private Object b[];
}