package cn.autoparts.exception;

public class CategoryBrandException extends Exception {
    public CategoryBrandException() {
        super();
    }

    public CategoryBrandException(String message) {
        super(message);
    }

    public CategoryBrandException(String message, Throwable cause) {
        super(message, cause);
    }

    public CategoryBrandException(Throwable cause) {
        super(cause);
    }

    protected CategoryBrandException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
