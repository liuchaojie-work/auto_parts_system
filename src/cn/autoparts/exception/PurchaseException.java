package cn.autoparts.exception;

public class PurchaseException extends Exception {
    public PurchaseException() {
        super();
    }

    public PurchaseException(String message) {
        super(message);
    }

    public PurchaseException(String message, Throwable cause) {
        super(message, cause);
    }

    public PurchaseException(Throwable cause) {
        super(cause);
    }

    protected PurchaseException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
