
package org.springframework.web.servlet.handler;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.logging.Log;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;


public class SimpleMappingExceptionResolver extends AbstractHandlerExceptionResolver
{

    public SimpleMappingExceptionResolver()
    {
        statusCodes = new HashMap();
        exceptionAttribute = "exception";
    }

    public void setExceptionMappings(Properties mappings)
    {
        exceptionMappings = mappings;
    }

    public  void setExcludedExceptions(Class excludedExceptions[])
    {
        this.excludedExceptions = excludedExceptions;
    }

    public void setDefaultErrorView(String defaultErrorView)
    {
        this.defaultErrorView = defaultErrorView;
    }

    public void setStatusCodes(Properties statusCodes)
    {
        String viewName;
        Integer statusCode;
        for(Enumeration enumeration = statusCodes.propertyNames(); enumeration.hasMoreElements(); this.statusCodes.put(viewName, statusCode))
        {
            viewName = (String)enumeration.nextElement();
            statusCode = new Integer(statusCodes.getProperty(viewName));
        }

    }

    public void addStatusCode(String viewName, int statusCode)
    {
        statusCodes.put(viewName, Integer.valueOf(statusCode));
    }

    public Map getStatusCodesAsMap()
    {
        return Collections.unmodifiableMap(statusCodes);
    }

    public void setDefaultStatusCode(int defaultStatusCode)
    {
        this.defaultStatusCode = Integer.valueOf(defaultStatusCode);
    }

    public void setExceptionAttribute(String exceptionAttribute)
    {
        this.exceptionAttribute = exceptionAttribute;
    }

    protected ModelAndView doResolveException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
    {
        String viewName = determineViewName(ex, request);
        if(viewName != null)
        {
            Integer statusCode = determineStatusCode(request, viewName);
            if(statusCode != null)
                applyStatusCodeIfPossible(request, response, statusCode.intValue());
            return getModelAndView(viewName, ex, request);
        } else
        {
            return null;
        }
    }

    protected String determineViewName(Exception ex, HttpServletRequest request)
    {
        String viewName = null;
        if(excludedExceptions != null)
        {
            Class aclass[] = excludedExceptions;
            int i = aclass.length;
            for(int j = 0; j < i; j++)
            {
                Class excludedEx = aclass[j];
                if(excludedEx.equals(ex.getClass()))
                    return null;
            }

        }
        if(exceptionMappings != null)
            viewName = findMatchingViewName(exceptionMappings, ex);
        if(viewName == null && defaultErrorView != null)
        {
            if(logger.isDebugEnabled())
                logger.debug((new StringBuilder()).append("Resolving to default view '").append(defaultErrorView).append("' for exception of type [").append(ex.getClass().getName()).append("]").toString());
            viewName = defaultErrorView;
        }
        return viewName;
    }

    protected String findMatchingViewName(Properties exceptionMappings, Exception ex)
    {
        String viewName = null;
        String dominantMapping = null;
        int deepest = 2147483647;
        Enumeration names = exceptionMappings.propertyNames();
        do
        {
            if(!names.hasMoreElements())
                break;
            String exceptionMapping = (String)names.nextElement();
            int depth = getDepth(exceptionMapping, ex);
            if(depth >= 0 && (depth < deepest || depth == deepest && dominantMapping != null && exceptionMapping.length() > dominantMapping.length()))
            {
                deepest = depth;
                dominantMapping = exceptionMapping;
                viewName = exceptionMappings.getProperty(exceptionMapping);
            }
        } while(true);
        if(viewName != null && logger.isDebugEnabled())
            logger.debug((new StringBuilder()).append("Resolving to view '").append(viewName).append("' for exception of type [").append(ex.getClass().getName()).append("], based on exception mapping [").append(dominantMapping).append("]").toString());
        return viewName;
    }

    protected int getDepth(String exceptionMapping, Exception ex)
    {
        return getDepth(exceptionMapping, ex.getClass(), 0);
    }

    private int getDepth(String exceptionMapping, Class exceptionClass, int depth)
    {
        if(exceptionClass.getName().contains(exceptionMapping))
            return depth;
        if(exceptionClass == java.lang.Throwable.class)
            return -1;
        else
            return getDepth(exceptionMapping, exceptionClass.getSuperclass(), depth + 1);
    }

    protected Integer determineStatusCode(HttpServletRequest request, String viewName)
    {
        if(statusCodes.containsKey(viewName))
            return (Integer)statusCodes.get(viewName);
        else
            return defaultStatusCode;
    }

    protected void applyStatusCodeIfPossible(HttpServletRequest request, HttpServletResponse response, int statusCode)
    {
        if(!WebUtils.isIncludeRequest(request))
        {
            if(logger.isDebugEnabled())
                logger.debug((new StringBuilder()).append("Applying HTTP status code ").append(statusCode).toString());
            response.setStatus(statusCode);
            request.setAttribute("javax.servlet.error.status_code", Integer.valueOf(statusCode));
        }
    }

    protected ModelAndView getModelAndView(String viewName, Exception ex, HttpServletRequest request)
    {
        return getModelAndView(viewName, ex);
    }

    protected ModelAndView getModelAndView(String viewName, Exception ex)
    {
        ModelAndView mv = new ModelAndView(viewName);
        if(exceptionAttribute != null)
        {
            if(logger.isDebugEnabled())
                logger.debug((new StringBuilder()).append("Exposing Exception as model attribute '").append(exceptionAttribute).append("'").toString());
            mv.addObject(exceptionAttribute, ex);
        }
        return mv;
    }

    public static final String DEFAULT_EXCEPTION_ATTRIBUTE = "exception";
    private Properties exceptionMappings;
    private Class excludedExceptions[];
    private String defaultErrorView;
    private Integer defaultStatusCode;
    private Map statusCodes;
    private String exceptionAttribute;
}
