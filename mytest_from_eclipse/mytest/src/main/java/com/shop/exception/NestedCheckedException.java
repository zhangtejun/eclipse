package com.shop.exception;

import java.io.PrintStream;
import java.io.PrintWriter;

public abstract class NestedCheckedException extends Exception
{

    public NestedCheckedException(String msg)
    {
        super(msg);
    }

    public NestedCheckedException(String msg, Object args[])
    {
        super(msg);
        this.args = args;
    }

    public NestedCheckedException(String msg, Throwable ex, Object args[])
    {
        super(msg, ex);
        this.args = args;
    }

    public NestedCheckedException(String msg, Throwable cause)
    {
        super(msg, cause);
    }

    public Throwable getRootCause()
    {
        Throwable rootCause = null;
        for(Throwable cause = getCause(); cause != null && cause != rootCause; cause = cause.getCause())
            rootCause = cause;

        return rootCause;
    }

    public Throwable getMostSpecificCause()
    {
        Throwable rootCause = getRootCause();
        return ((Throwable) (rootCause == null ? this : rootCause));
    }

    public boolean contains(Class exType)
    {
        if(exType == null)
            return false;
        if(exType.isInstance(this))
            return true;
        Throwable cause = getCause();
        if(cause == this)
            return false;
        if(cause instanceof NestedCheckedException)
            return ((NestedCheckedException)cause).contains(exType);
        for(; cause != null; cause = cause.getCause())
        {
            if(exType.isInstance(cause))
                return true;
            if(cause.getCause() == cause)
                break;
        }

        return false;
    }

    public void setArgs(Object args[])
    {
        this.args = args;
    }

    public String getMessage()
    {
        StringBuffer sb;
        if(getCause() == null)
        {
            if(args == null)
                return super.getMessage();
            sb = new StringBuffer(super.getMessage());
            sb.append(" Args: ");
            for(int i = 0; i < args.length; i++)
                sb.append(args[i]).append(" ");

            return sb.toString();
        }
        if(args == null)
            return super.getMessage() + "; nested exception is " + getCause().getClass().getName() + ": " + getCause().getMessage();
        sb = new StringBuffer(super.getMessage());
        sb.append(" Args: ");
        for(int i = 0; i < args.length; i++)
            sb.append(args[i]).append(" ");

        sb.append("; nested exception is ").append(getCause().getClass().getName()).append(": ").append(getCause().getMessage());
        return sb.toString();
    }

    public void printStackTrace(PrintStream ps)
    {
        if(getCause() == null)
        {
            super.printStackTrace(ps);
        } else
        {
            ps.println(this);
            getCause().printStackTrace(ps);
        }
    }

    public void printStackTrace(PrintWriter pw)
    {
        if(getCause() == null)
        {
            super.printStackTrace(pw);
        } else
        {
            pw.println(this);
            getCause().printStackTrace(pw);
        }
    }

    private static final long serialVersionUID = 7100714597678207546L;
    private Object args[];
}