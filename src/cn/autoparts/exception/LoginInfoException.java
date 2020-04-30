package cn.autoparts.exception;

public class LoginInfoException extends Exception {
    public LoginInfoException() {
        super();
    }

    public LoginInfoException(String message) {
        super(message);
    }

    public LoginInfoException(String message, Throwable cause) {
        super(message, cause);
    }

    public LoginInfoException(Throwable cause) {
        super(cause);
    }

    protected LoginInfoException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
