package cn.autoparts.exception;

public class LogisticsException extends Exception {
    public LogisticsException() {
        super();
    }

    public LogisticsException(String message) {
        super(message);
    }

    public LogisticsException(String message, Throwable cause) {
        super(message, cause);
    }

    public LogisticsException(Throwable cause) {
        super(cause);
    }

    protected LogisticsException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
