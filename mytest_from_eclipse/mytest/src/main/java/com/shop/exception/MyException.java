package com.shop.exception;



public class MyException extends NestedCheckedException implements Messageable{
    public MyException()
    {
        super("");
        mSupport = new MessageSupport();
        mSupport.setMessageKey("my.error.undefined");
    }

    public MyException(String s)
    {
        super(s);
        mSupport = new MessageSupport();
        if(s == null || s.trim().length() == 0)
            mSupport.setMessageKey("my.error.undefined");
        else
            mSupport.setMessageKey(s);
    }

    public MyException(String s, Object aobj[])
    {
        super(s, aobj);
        mSupport = new MessageSupport();
        if(s == null || s.trim().length() == 0)
            mSupport.setMessageKey("my.error.undefined");
        else
            mSupport.setMessageKey(s);
        mSupport.setArgs(aobj);
    }

    public MyException(String s, Throwable throwable)
    {
        super(s, throwable);
        mSupport = new MessageSupport();
        if(s == null || s.trim().length() == 0)
            mSupport.setMessageKey("my.error.undefined");
        else
            mSupport.setMessageKey(s);
    }

    public MyException(String s, Throwable throwable, Object aobj[])
    {
        super(s, throwable, aobj);
        mSupport = new MessageSupport();
        if(s == null || s.trim().length() == 0)
            mSupport.setMessageKey("my.error.undefined");
        else
            mSupport.setMessageKey(s);
        mSupport.setArgs(aobj);
    }

    public MyException(Throwable throwable)
    {
        super("", throwable);
        mSupport = new MessageSupport();
        mSupport.setMessageKey("my.error.undefined");
    }

    public boolean hasDefaultMessage()
    {
        return mSupport.hasDefaultMessage();
    }

    public void setDefaultMessage(String s)
    {
        mSupport.setDefaultMessage(s);
    }

    public String getDefaultMessage()
    {
        String s = mSupport.getDefaultMessage();
        if(s == null)
        {
            StringBuffer stringbuffer = (new StringBuffer(getClass().getName())).append(" MessageCode: ").append(getMessageKey());
            if(mSupport.getArgs() != null)
            {
                stringbuffer.append(" Args: ");
                Object aobj[] = mSupport.getArgs();
                for(int i = 0; i < aobj.length; i++)
                    stringbuffer.append(aobj[i]).append(" ");

            }
            if(getCause() != null)
            {
                stringbuffer.append(" nested exception is: ");
                stringbuffer.append(getCause());
            }
            return stringbuffer.toString();
        } else
        {
            return s;
        }
    }

    public String toString()
    {
        StringBuffer stringbuffer = new StringBuffer(super.toString());
        if(mSupport.getArgs() != null)
        {
            stringbuffer.append(" Args:");
            Object aobj[] = mSupport.getArgs();
            for(int i = 0; i < aobj.length; i++)
                stringbuffer.append(aobj[i]).append(" ");

        }
        return stringbuffer.toString();
    }

    public String getMessageKey()
    {
        return mSupport.getMessageKey();
    }

    public Object[] getArgs()
    {
        return mSupport.getArgs();
    }

    public void setArgs(Object aobj[])
    {
        super.setArgs(aobj);
        mSupport.setArgs(aobj);
    }

    private MessageSupport mSupport;
    private static final String myError = "my.error.undefined";
}