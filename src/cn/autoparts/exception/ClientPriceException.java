package cn.autoparts.exception;

public class ClientPriceException extends Exception {
    public ClientPriceException() {
        super();
    }

    public ClientPriceException(String message) {
        super(message);
    }

    public ClientPriceException(String message, Throwable cause) {
        super(message, cause);
    }

    public ClientPriceException(Throwable cause) {
        super(cause);
    }

    protected ClientPriceException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
