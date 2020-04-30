package cn.autoparts.exception;

public class LocationException extends Exception {
    public LocationException() {
        super();
    }

    public LocationException(String message) {
        super(message);
    }

    public LocationException(String message, Throwable cause) {
        super(message, cause);
    }

    public LocationException(Throwable cause) {
        super(cause);
    }

    protected LocationException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
