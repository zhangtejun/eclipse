package com.shop.exception;

public class ValidationException extends MyException implements VaMessage{
    /**
	 * 
	 */
	private static final long serialVersionUID = 3221123647175873617L;

	public ValidationException()
    {
    }

    public ValidationException(String s)
    {
        super(s);
    }

    public ValidationException(String s, Object aobj[])
    {
        super(s, aobj);
    }

    public ValidationException(String s, Throwable throwable)
    {
        super(s, throwable);
    }

    public ValidationException(String s, Throwable throwable, Object aobj[])
    {
        super(s, throwable, aobj);
    }

    public ValidationException(Throwable throwable)
    {
        super(throwable);
    }
}
