// Overall Purpose: This class acts as a global safety net to catch and display unhandled exceptions across the entire application.

package com.example.WD153.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.PrintWriter;
import java.io.StringWriter;

/**
 * Uses Spring's @ControllerAdvice to intercept exceptions thrown by any @Controller.
 * This prevents the default white-label error page and returns the stack trace directly for debugging.
 */

@ControllerAdvice
public class GlobalExceptionHandler {

    /**
     * Catches all exceptions of type Exception.class.
     * @param ex The caught exception
     * @return The raw stack trace as a string response
     */

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public String handleAllExceptions(Exception ex) {
        // Convert the stack trace into a readable string format
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        ex.printStackTrace(pw);

        // Output the error directly to the browser
        return "ERROR_CAUGHT_BY_ADVICE:\n" + ex.getMessage() + "\n\n" + sw.toString();
    }
}
