package cn.autoparts.exception;

public class BrandException extends Exception {
    public BrandException() {
        super();
    }

    public BrandException(String message) {
        super(message);
    }

    public BrandException(String message, Throwable cause) {
        super(message, cause);
    }

    public BrandException(Throwable cause) {
        super(cause);
    }

    protected BrandException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
