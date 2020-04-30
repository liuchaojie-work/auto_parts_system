package cn.autoparts.exception;

public class ProductSellException extends Exception {
    public ProductSellException() {
        super();
    }

    public ProductSellException(String message) {
        super(message);
    }

    public ProductSellException(String message, Throwable cause) {
        super(message, cause);
    }

    public ProductSellException(Throwable cause) {
        super(cause);
    }

    protected ProductSellException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
