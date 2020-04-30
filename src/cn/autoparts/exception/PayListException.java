package cn.autoparts.exception;

public class PayListException extends Exception {
    public PayListException() {
        super();
    }

    public PayListException(String message) {
        super(message);
    }

    public PayListException(String message, Throwable cause) {
        super(message, cause);
    }

    public PayListException(Throwable cause) {
        super(cause);
    }

    protected PayListException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
