package org.springframework.web.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.BeanFactoryUtils;
import org.springframework.beans.factory.BeanInitializationException;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.i18n.LocaleContext;
import org.springframework.core.annotation.AnnotationAwareOrderComparator;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PropertiesLoaderUtils;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.ui.context.ThemeSource;
import org.springframework.util.ClassUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.ServletWebRequest;
import org.springframework.web.context.request.async.WebAsyncManager;
import org.springframework.web.context.request.async.WebAsyncUtils;
import org.springframework.web.multipart.MultipartException;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.util.NestedServletException;
import org.springframework.web.util.WebUtils;

public class DispatcherServlet
  extends FrameworkServlet
{
  public static final String MULTIPART_RESOLVER_BEAN_NAME = "multipartResolver";
  public static final String LOCALE_RESOLVER_BEAN_NAME = "localeResolver";
  public static final String THEME_RESOLVER_BEAN_NAME = "themeResolver";
  public static final String HANDLER_MAPPING_BEAN_NAME = "handlerMapping";
  public static final String HANDLER_ADAPTER_BEAN_NAME = "handlerAdapter";
  public static final String HANDLER_EXCEPTION_RESOLVER_BEAN_NAME = "handlerExceptionResolver";
  public static final String REQUEST_TO_VIEW_NAME_TRANSLATOR_BEAN_NAME = "viewNameTranslator";
  public static final String VIEW_RESOLVER_BEAN_NAME = "viewResolver";
  public static final String FLASH_MAP_MANAGER_BEAN_NAME = "flashMapManager";
  public static final String WEB_APPLICATION_CONTEXT_ATTRIBUTE = DispatcherServlet.class.getName() + ".CONTEXT";
  public static final String LOCALE_RESOLVER_ATTRIBUTE = DispatcherServlet.class.getName() + ".LOCALE_RESOLVER";
  public static final String THEME_RESOLVER_ATTRIBUTE = DispatcherServlet.class.getName() + ".THEME_RESOLVER";
  public static final String THEME_SOURCE_ATTRIBUTE = DispatcherServlet.class.getName() + ".THEME_SOURCE";
  public static final String INPUT_FLASH_MAP_ATTRIBUTE = DispatcherServlet.class.getName() + ".INPUT_FLASH_MAP";
  public static final String OUTPUT_FLASH_MAP_ATTRIBUTE = DispatcherServlet.class.getName() + ".OUTPUT_FLASH_MAP";
  public static final String FLASH_MAP_MANAGER_ATTRIBUTE = DispatcherServlet.class.getName() + ".FLASH_MAP_MANAGER";
  public static final String EXCEPTION_ATTRIBUTE = DispatcherServlet.class.getName() + ".EXCEPTION";
  public static final String PAGE_NOT_FOUND_LOG_CATEGORY = "org.springframework.web.servlet.PageNotFound";
  private static final String DEFAULT_STRATEGIES_PATH = "DispatcherServlet.properties";
  protected static final Log pageNotFoundLogger = LogFactory.getLog("org.springframework.web.servlet.PageNotFound");
  private static final Properties defaultStrategies;
  
  static
  {
    try
    {
      ClassPathResource resource = new ClassPathResource("DispatcherServlet.properties", DispatcherServlet.class);
      defaultStrategies = PropertiesLoaderUtils.loadProperties(resource);
    }
    catch (IOException ex)
    {
      throw new IllegalStateException("Could not load 'DispatcherServlet.properties': " + ex.getMessage());
    }
  }
  
  private boolean detectAllHandlerMappings = true;
  private boolean detectAllHandlerAdapters = true;
  private boolean detectAllHandlerExceptionResolvers = true;
  private boolean detectAllViewResolvers = true;
  private boolean throwExceptionIfNoHandlerFound = false;
  private boolean cleanupAfterInclude = true;
  private MultipartResolver multipartResolver;
  private LocaleResolver localeResolver;
  private ThemeResolver themeResolver;
  private List<HandlerMapping> handlerMappings;
  private List handlerAdapters;
  private List handlerExceptionResolvers;
  private RequestToViewNameTranslator viewNameTranslator;
  private FlashMapManager flashMapManager;
  private List viewResolvers;
  
  public DispatcherServlet(WebApplicationContext webApplicationContext)
  {
    super(webApplicationContext);
  }
  
  public void setDetectAllHandlerMappings(boolean detectAllHandlerMappings)
  {
    this.detectAllHandlerMappings = detectAllHandlerMappings;
  }
  
  public void setDetectAllHandlerAdapters(boolean detectAllHandlerAdapters)
  {
    this.detectAllHandlerAdapters = detectAllHandlerAdapters;
  }
  
  public void setDetectAllHandlerExceptionResolvers(boolean detectAllHandlerExceptionResolvers)
  {
    this.detectAllHandlerExceptionResolvers = detectAllHandlerExceptionResolvers;
  }
  
  public void setDetectAllViewResolvers(boolean detectAllViewResolvers)
  {
    this.detectAllViewResolvers = detectAllViewResolvers;
  }
  
  public void setThrowExceptionIfNoHandlerFound(boolean throwExceptionIfNoHandlerFound)
  {
    this.throwExceptionIfNoHandlerFound = throwExceptionIfNoHandlerFound;
  }
  
  public void setCleanupAfterInclude(boolean cleanupAfterInclude)
  {
    this.cleanupAfterInclude = cleanupAfterInclude;
  }
  
  protected void onRefresh(ApplicationContext context)
  {
    initStrategies(context);
  }
  
  protected void initStrategies(ApplicationContext context)
  {
    initMultipartResolver(context);
    initLocaleResolver(context);
    initThemeResolver(context);
    initHandlerMappings(context);
    initHandlerAdapters(context);
    initHandlerExceptionResolvers(context);
    initRequestToViewNameTranslator(context);
    initViewResolvers(context);
    initFlashMapManager(context);
  }
  
  private void initMultipartResolver(ApplicationContext context)
  {
    try
    {
      this.multipartResolver = ((MultipartResolver)context.getBean("multipartResolver", MultipartResolver.class));
      if (this.logger.isDebugEnabled()) {
        this.logger.debug("Using MultipartResolver [" + this.multipartResolver + "]");
      }
    }
    catch (NoSuchBeanDefinitionException ex)
    {
      this.multipartResolver = null;
      if (this.logger.isDebugEnabled()) {
        this.logger.debug("Unable to locate MultipartResolver with name 'multipartResolver': no multipart request handling provided");
      }
    }
  }
  
  private void initLocaleResolver(ApplicationContext context)
  {
    try
    {
      this.localeResolver = ((LocaleResolver)context.getBean("localeResolver", LocaleResolver.class));
      if (this.logger.isDebugEnabled()) {
        this.logger.debug("Using LocaleResolver [" + this.localeResolver + "]");
      }
    }
    catch (NoSuchBeanDefinitionException ex)
    {
      this.localeResolver = ((LocaleResolver)getDefaultStrategy(context, LocaleResolver.class));
      if (this.logger.isDebugEnabled()) {
        this.logger.debug("Unable to locate LocaleResolver with name 'localeResolver': using default [" + this.localeResolver + "]");
      }
    }
  }
  
  private void initThemeResolver(ApplicationContext context)
  {
    try
    {
      this.themeResolver = ((ThemeResolver)context.getBean("themeResolver", ThemeResolver.class));
      if (this.logger.isDebugEnabled()) {
        this.logger.debug("Using ThemeResolver [" + this.themeResolver + "]");
      }
    }
    catch (NoSuchBeanDefinitionException ex)
    {
      this.themeResolver = ((ThemeResolver)getDefaultStrategy(context, ThemeResolver.class));
      if (this.logger.isDebugEnabled()) {
        this.logger.debug("Unable to locate ThemeResolver with name 'themeResolver': using default [" + this.themeResolver + "]");
      }
    }
  }
  
  private void initHandlerMappings(ApplicationContext context)
  {
    this.handlerMappings = null;
    if (this.detectAllHandlerMappings)
    {
      Map<String, HandlerMapping> matchingBeans = BeanFactoryUtils.beansOfTypeIncludingAncestors(context, HandlerMapping.class, true, false);
      if (!matchingBeans.isEmpty())
      {
        this.handlerMappings = new ArrayList(matchingBeans.values());
        
        AnnotationAwareOrderComparator.sort(this.handlerMappings);
      }
    }
    else
    {
      try
      {
        HandlerMapping hm = (HandlerMapping)context.getBean("handlerMapping", HandlerMapping.class);
        this.handlerMappings = Collections.singletonList(hm);
      }
      catch (NoSuchBeanDefinitionException localNoSuchBeanDefinitionException) {}
    }
    if (this.handlerMappings == null)
    {
      this.handlerMappings = getDefaultStrategies(context, HandlerMapping.class);
      if (this.logger.isDebugEnabled()) {
        this.logger.debug("No HandlerMappings found in servlet '" + getServletName() + "': using default");
      }
    }
  }
  
  private void initHandlerAdapters(ApplicationContext context)
  {
    this.handlerAdapters = null;
    if (this.detectAllHandlerAdapters)
    {
      Map<String, HandlerAdapter> matchingBeans = BeanFactoryUtils.beansOfTypeIncludingAncestors(context, HandlerAdapter.class, true, false);
      if (!matchingBeans.isEmpty())
      {
        this.handlerAdapters = new ArrayList(matchingBeans.values());
        
        AnnotationAwareOrderComparator.sort(this.handlerAdapters);
      }
    }
    else
    {
      try
      {
        HandlerAdapter ha = (HandlerAdapter)context.getBean("handlerAdapter", HandlerAdapter.class);
        this.handlerAdapters = Collections.singletonList(ha);
      }
      catch (NoSuchBeanDefinitionException localNoSuchBeanDefinitionException) {}
    }
    if (this.handlerAdapters == null)
    {
      this.handlerAdapters = getDefaultStrategies(context, HandlerAdapter.class);
      if (this.logger.isDebugEnabled()) {
        this.logger.debug("No HandlerAdapters found in servlet '" + getServletName() + "': using default");
      }
    }
  }
  
  private void initHandlerExceptionResolvers(ApplicationContext context)
  {
    this.handlerExceptionResolvers = null;
    if (this.detectAllHandlerExceptionResolvers)
    {
      Map<String, HandlerExceptionResolver> matchingBeans = BeanFactoryUtils.beansOfTypeIncludingAncestors(context, HandlerExceptionResolver.class, true, false);
      if (!matchingBeans.isEmpty())
      {
        this.handlerExceptionResolvers = new ArrayList(matchingBeans.values());
        
        AnnotationAwareOrderComparator.sort(this.handlerExceptionResolvers);
      }
    }
    else
    {
      try
      {
        HandlerExceptionResolver her = (HandlerExceptionResolver)context.getBean("handlerExceptionResolver", HandlerExceptionResolver.class);
        this.handlerExceptionResolvers = Collections.singletonList(her);
      }
      catch (NoSuchBeanDefinitionException localNoSuchBeanDefinitionException) {}
    }
    if (this.handlerExceptionResolvers == null)
    {
      this.handlerExceptionResolvers = getDefaultStrategies(context, HandlerExceptionResolver.class);
      if (this.logger.isDebugEnabled()) {
        this.logger.debug("No HandlerExceptionResolvers found in servlet '" + getServletName() + "': using default");
      }
    }
  }
  
  private void initRequestToViewNameTranslator(ApplicationContext context)
  {
    try
    {
      this.viewNameTranslator = ((RequestToViewNameTranslator)context.getBean("viewNameTranslator", RequestToViewNameTranslator.class));
      if (this.logger.isDebugEnabled()) {
        this.logger.debug("Using RequestToViewNameTranslator [" + this.viewNameTranslator + "]");
      }
    }
    catch (NoSuchBeanDefinitionException ex)
    {
      this.viewNameTranslator = ((RequestToViewNameTranslator)getDefaultStrategy(context, RequestToViewNameTranslator.class));
      if (this.logger.isDebugEnabled()) {
        this.logger.debug("Unable to locate RequestToViewNameTranslator with name 'viewNameTranslator': using default [" + this.viewNameTranslator + "]");
      }
    }
  }
  
  private void initViewResolvers(ApplicationContext context)
  {
    this.viewResolvers = null;
    if (this.detectAllViewResolvers)
    {
      Map<String, ViewResolver> matchingBeans = BeanFactoryUtils.beansOfTypeIncludingAncestors(context, ViewResolver.class, true, false);
      if (!matchingBeans.isEmpty())
      {
        this.viewResolvers = new ArrayList(matchingBeans.values());
        
        AnnotationAwareOrderComparator.sort(this.viewResolvers);
      }
    }
    else
    {
      try
      {
        ViewResolver vr = (ViewResolver)context.getBean("viewResolver", ViewResolver.class);
        this.viewResolvers = Collections.singletonList(vr);
      }
      catch (NoSuchBeanDefinitionException localNoSuchBeanDefinitionException) {}
    }
    if (this.viewResolvers == null)
    {
      this.viewResolvers = getDefaultStrategies(context, ViewResolver.class);
      if (this.logger.isDebugEnabled()) {
        this.logger.debug("No ViewResolvers found in servlet '" + getServletName() + "': using default");
      }
    }
  }
  
  private void initFlashMapManager(ApplicationContext context)
  {
    try
    {
      this.flashMapManager = ((FlashMapManager)context.getBean("flashMapManager", FlashMapManager.class));
      if (this.logger.isDebugEnabled()) {
        this.logger.debug("Using FlashMapManager [" + this.flashMapManager + "]");
      }
    }
    catch (NoSuchBeanDefinitionException ex)
    {
      this.flashMapManager = ((FlashMapManager)getDefaultStrategy(context, FlashMapManager.class));
      if (this.logger.isDebugEnabled()) {
        this.logger.debug("Unable to locate FlashMapManager with name 'flashMapManager': using default [" + this.flashMapManager + "]");
      }
    }
  }
  
  public final ThemeSource getThemeSource()
  {
    if ((getWebApplicationContext() instanceof ThemeSource)) {
      return (ThemeSource)getWebApplicationContext();
    }
    return null;
  }
  
  public final MultipartResolver getMultipartResolver()
  {
    return this.multipartResolver;
  }
  
  protected <T> T getDefaultStrategy(ApplicationContext context, Class<T> strategyInterface)
  {
    List<T> strategies = getDefaultStrategies(context, strategyInterface);
    if (strategies.size() != 1) {
      throw new BeanInitializationException("DispatcherServlet needs exactly 1 strategy for interface [" + strategyInterface.getName() + "]");
    }
    return strategies.get(0);
  }
  
  protected <T> List<T> getDefaultStrategies(ApplicationContext context, Class<T> strategyInterface)
  {
    String key = strategyInterface.getName();
    String value = defaultStrategies.getProperty(key);
    if (value != null)
    {
      String[] classNames = StringUtils.commaDelimitedListToStringArray(value);
      List<T> strategies = new ArrayList(classNames.length);
      for (String className : classNames) {
        try
        {
          Class<?> clazz = ClassUtils.forName(className, DispatcherServlet.class.getClassLoader());
          Object strategy = createDefaultStrategy(context, clazz);
          strategies.add((T) strategy);
        }
        catch (ClassNotFoundException ex)
        {
          throw new BeanInitializationException("Could not find DispatcherServlet's default strategy class [" + className + "] for interface [" + key + "]", ex);
        }
        catch (LinkageError err)
        {
          throw new BeanInitializationException("Error loading DispatcherServlet's default strategy class [" + className + "] for interface [" + key + "]: problem with class file or dependent class", err);
        }
      }
      return strategies;
    }
    return new LinkedList();
  }
  
  protected Object createDefaultStrategy(ApplicationContext context, Class<?> clazz)
  {
    return context.getAutowireCapableBeanFactory().createBean(clazz);
  }
  
  protected void doService(HttpServletRequest request, HttpServletResponse response)
    throws Exception
  {
    if (this.logger.isDebugEnabled())
    {
      String resumed = WebAsyncUtils.getAsyncManager(request).hasConcurrentResult() ? " resumed" : "";
      this.logger.debug("DispatcherServlet with name '" + getServletName() + "'" + resumed + " processing " + request
        .getMethod() + " request for [" + getRequestUri(request) + "]");
    }
    Map<String, Object> attributesSnapshot = null;
    if (WebUtils.isIncludeRequest(request))
    {
      attributesSnapshot = new HashMap();
      Enumeration<?> attrNames = request.getAttributeNames();
      while (attrNames.hasMoreElements())
      {
        String attrName = (String)attrNames.nextElement();
        if ((this.cleanupAfterInclude) || (attrName.startsWith("org.springframework.web.servlet"))) {
          attributesSnapshot.put(attrName, request.getAttribute(attrName));
        }
      }
    }
    request.setAttribute(WEB_APPLICATION_CONTEXT_ATTRIBUTE, getWebApplicationContext());
    request.setAttribute(LOCALE_RESOLVER_ATTRIBUTE, this.localeResolver);
    request.setAttribute(THEME_RESOLVER_ATTRIBUTE, this.themeResolver);
    request.setAttribute(THEME_SOURCE_ATTRIBUTE, getThemeSource());
    
    FlashMap inputFlashMap = this.flashMapManager.retrieveAndUpdate(request, response);
    if (inputFlashMap != null) {
      request.setAttribute(INPUT_FLASH_MAP_ATTRIBUTE, Collections.unmodifiableMap(inputFlashMap));
    }
    request.setAttribute(OUTPUT_FLASH_MAP_ATTRIBUTE, new FlashMap());
    request.setAttribute(FLASH_MAP_MANAGER_ATTRIBUTE, this.flashMapManager);
    try
    {
      doDispatch(request, response);
    }
    finally
    {
      if (!WebAsyncUtils.getAsyncManager(request).isConcurrentHandlingStarted()) {
        if (attributesSnapshot != null) {
          restoreAttributesAfterInclude(request, attributesSnapshot);
        }
      }
    }
  }
  
  protected void doDispatch(HttpServletRequest request, HttpServletResponse response)
    throws Exception
  {
    HttpServletRequest processedRequest = request;
    HandlerExecutionChain mappedHandler = null;
    boolean multipartRequestParsed = false;
    
    WebAsyncManager asyncManager = WebAsyncUtils.getAsyncManager(request);
    try
    {
      ModelAndView mv = null;
      Exception dispatchException = null;
      try
      {
        processedRequest = checkMultipart(request);
        multipartRequestParsed = processedRequest != request;
        

        mappedHandler = getHandler(processedRequest);
        if ((mappedHandler == null) || (mappedHandler.getHandler() == null))
        {
          noHandlerFound(processedRequest, response);
          return;
        }
        HandlerAdapter ha = getHandlerAdapter(mappedHandler.getHandler());
        

        String method = request.getMethod();
        boolean isGet = "GET".equals(method);
        if ((isGet) || ("HEAD".equals(method)))
        {
          long lastModified = ha.getLastModified(request, mappedHandler.getHandler());
          if (this.logger.isDebugEnabled()) {
            this.logger.debug("Last-Modified value for [" + getRequestUri(request) + "] is: " + lastModified);
          }
          if ((new ServletWebRequest(request, response).checkNotModified(lastModified)) && (isGet)) {
            return;
          }
        }
        if (!mappedHandler.applyPreHandle(processedRequest, response)) {//处理前置拦截器
          return;
        }
        //处理最终的Action逻辑
        mv = ha.handle(processedRequest, response, mappedHandler.getHandler());
        if (asyncManager.isConcurrentHandlingStarted()) {
          return;
        }
        applyDefaultViewName(processedRequest, mv);//view
        mappedHandler.applyPostHandle(processedRequest, response, mv);//处理后置拦截器
      }
      catch (Exception ex)
      {
        dispatchException = ex;
      }
      processDispatchResult(processedRequest, response, mappedHandler, mv, dispatchException);
    }
    catch (Exception ex)
    {
      triggerAfterCompletion(processedRequest, response, mappedHandler, ex);
    }
    catch (Error err)
    {
      triggerAfterCompletionWithError(processedRequest, response, mappedHandler, err);
    }
    finally
    {
      if (asyncManager.isConcurrentHandlingStarted())
      {
        if (mappedHandler != null) {
          mappedHandler.applyAfterConcurrentHandlingStarted(processedRequest, response);
        }
      }
      else if (multipartRequestParsed) {
        cleanupMultipart(processedRequest);
      }
    }
  }
  
  private void applyDefaultViewName(HttpServletRequest request, ModelAndView mv)
    throws Exception
  {
    if ((mv != null) && (!mv.hasView())) {
      mv.setViewName(getDefaultViewName(request));
    }
  }
  
  private void processDispatchResult(HttpServletRequest request, HttpServletResponse response, HandlerExecutionChain mappedHandler, ModelAndView mv, Exception exception)
    throws Exception
  {
    boolean errorView = false;
    if (exception != null) {
      if ((exception instanceof ModelAndViewDefiningException))
      {
        this.logger.debug("ModelAndViewDefiningException encountered", exception);
        mv = ((ModelAndViewDefiningException)exception).getModelAndView();
      }
      else
      {
        Object handler = mappedHandler != null ? mappedHandler.getHandler() : null;
        mv = processHandlerException(request, response, handler, exception);
        errorView = mv != null;
      }
    }
    if ((mv != null) && (!mv.wasCleared()))
    {
      render(mv, request, response);
      if (errorView) {
        WebUtils.clearErrorRequestAttributes(request);
      }
    }
    else if (this.logger.isDebugEnabled())
    {
      this.logger.debug("Null ModelAndView returned to DispatcherServlet with name '" + getServletName() + "': assuming HandlerAdapter completed request handling");
    }
    if (WebAsyncUtils.getAsyncManager(request).isConcurrentHandlingStarted()) {
      return;
    }
    if (mappedHandler != null) {
      mappedHandler.triggerAfterCompletion(request, response, null);
    }
  }
  
  protected LocaleContext buildLocaleContext(final HttpServletRequest request)
  {
    if ((this.localeResolver instanceof LocaleContextResolver)) {
      return ((LocaleContextResolver)this.localeResolver).resolveLocaleContext(request);
    }
    return new LocaleContext()
    {
      public Locale getLocale()
      {
        return DispatcherServlet.this.localeResolver.resolveLocale(request);
      }
    };
  }
  
  protected HttpServletRequest checkMultipart(HttpServletRequest request)
    throws MultipartException
  {
    if ((this.multipartResolver != null) && (this.multipartResolver.isMultipart(request))) {
      if (WebUtils.getNativeRequest(request, MultipartHttpServletRequest.class) != null) {
        this.logger.debug("Request is already a MultipartHttpServletRequest - if not in a forward, this typically results from an additional MultipartFilter in web.xml");
      } else if ((request.getAttribute("javax.servlet.error.exception") instanceof MultipartException)) {
        this.logger.debug("Multipart resolution failed for current request before - skipping re-resolution for undisturbed error rendering");
      } else {
        return this.multipartResolver.resolveMultipart(request);
      }
    }
    return request;
  }
  
  protected void cleanupMultipart(HttpServletRequest request)
  {
    MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)WebUtils.getNativeRequest(request, MultipartHttpServletRequest.class);
    if (multipartRequest != null) {
      this.multipartResolver.cleanupMultipart(multipartRequest);
    }
  }
  
  protected HandlerExecutionChain getHandler(HttpServletRequest request)
    throws Exception
  {
    for (HandlerMapping hm : this.handlerMappings)
    {
      if (this.logger.isTraceEnabled()) {
        this.logger.trace("Testing handler map [" + hm + "] in DispatcherServlet with name '" + 
          getServletName() + "'");
      }
      HandlerExecutionChain handler = hm.getHandler(request);
      if (handler != null) {
        return handler;
      }
    }
    return null;
  }
  
  protected void noHandlerFound(HttpServletRequest request, HttpServletResponse response)
    throws Exception
  {
    if (pageNotFoundLogger.isWarnEnabled()) {
      pageNotFoundLogger.warn("No mapping found for HTTP request with URI [" + getRequestUri(request) + "] in DispatcherServlet with name '" + 
        getServletName() + "'");
    }
    if (this.throwExceptionIfNoHandlerFound) {
      throw new NoHandlerFoundException(request.getMethod(), getRequestUri(request), new ServletServerHttpRequest(request).getHeaders());
    }
    response.sendError(404);
  }
  
  protected HandlerAdapter getHandlerAdapter(Object handler)
    throws ServletException
  {
      for(Iterator iterator = handlerAdapters.iterator(); iterator.hasNext();)
      {
          HandlerAdapter ha = (HandlerAdapter)iterator.next();
          if(logger.isTraceEnabled())
              logger.trace((new StringBuilder()).append("Testing handler adapter [").append(ha).append("]").toString());
          if(ha.supports(handler))
              return ha;
      }

      throw new ServletException((new StringBuilder()).append("No adapter for handler [").append(handler).append("]: The DispatcherServlet configuration needs to include a HandlerAdapter that supports this handler").toString());
  }
  
  protected ModelAndView processHandlerException(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
    throws Exception
  {
      ModelAndView exMv = null;
      Iterator iterator = handlerExceptionResolvers.iterator();
      do
      {
          if(!iterator.hasNext())
              break;
          HandlerExceptionResolver handlerExceptionResolver = (HandlerExceptionResolver)iterator.next();
          exMv = handlerExceptionResolver.resolveException(request, response, handler, ex);
      } while(exMv == null);
      if(exMv != null)
      {
          if(exMv.isEmpty())
          {
              request.setAttribute(EXCEPTION_ATTRIBUTE, ex);
              return null;
          }
          if(!exMv.hasView())
              exMv.setViewName(getDefaultViewName(request));
          if(logger.isDebugEnabled())
              logger.debug((new StringBuilder()).append("Handler execution resulted in exception - forwarding to resolved error view: ").append(exMv).toString(), ex);
          WebUtils.exposeErrorRequestAttributes(request, ex, getServletName());
          return exMv;
      } else
      {
          throw ex;
      }
  }
  
  protected void render(ModelAndView mv, HttpServletRequest request, HttpServletResponse response)
    throws Exception
  {
      Locale locale = localeResolver.resolveLocale(request);
      response.setLocale(locale);
      View view;
      if(mv.isReference())
      {
          view = resolveViewName(mv.getViewName(), mv.getModelInternal(), locale, request);
          if(view == null)
              throw new ServletException((new StringBuilder()).append("Could not resolve view with name '").append(mv.getViewName()).append("' in servlet with name '").append(getServletName()).append("'").toString());
      } else
      {
          view = mv.getView();
          if(view == null)
              throw new ServletException((new StringBuilder()).append("ModelAndView [").append(mv).append("] neither contains a view name nor a ").append("View object in servlet with name '").append(getServletName()).append("'").toString());
      }
      if(logger.isDebugEnabled())
          logger.debug((new StringBuilder()).append("Rendering view [").append(view).append("] in DispatcherServlet with name '").append(getServletName()).append("'").toString());
      try
      {
          view.render(mv.getModelInternal(), request, response);
      }
      catch(Exception ex)
      {
          if(logger.isDebugEnabled())
              logger.debug((new StringBuilder()).append("Error rendering view [").append(view).append("] in DispatcherServlet with name '").append(getServletName()).append("'").toString(), ex);
          throw ex;
      }
  }
  
  protected String getDefaultViewName(HttpServletRequest request)
    throws Exception
  {
    return this.viewNameTranslator.getViewName(request);
  }
  
  protected View resolveViewName(String viewName, Map<String, Object> model, Locale locale, HttpServletRequest request)
    throws Exception
  {
      for(Iterator iterator = viewResolvers.iterator(); iterator.hasNext();)
      {
          ViewResolver viewResolver = (ViewResolver)iterator.next();
          View view = viewResolver.resolveViewName(viewName, locale);
          if(view != null)
              return view;
      }

      return null;
  }
  
  private void triggerAfterCompletion(HttpServletRequest request, HttpServletResponse response, HandlerExecutionChain mappedHandler, Exception ex)
    throws Exception
  {
    if (mappedHandler != null) {
      mappedHandler.triggerAfterCompletion(request, response, ex);
    }
    throw ex;
  }
  
  private void triggerAfterCompletionWithError(HttpServletRequest request, HttpServletResponse response, HandlerExecutionChain mappedHandler, Error error)
    throws Exception
  {
    ServletException ex = new NestedServletException("Handler processing failed", error);
    if (mappedHandler != null) {
      mappedHandler.triggerAfterCompletion(request, response, ex);
    }
    throw ex;
  }
  
  private void restoreAttributesAfterInclude(HttpServletRequest request, Map<?, ?> attributesSnapshot)
  {
      Set attrsToCheck = new HashSet();
      Enumeration attrNames = request.getAttributeNames();
      do
      {
          if(!attrNames.hasMoreElements())
              break;
          String attrName = (String)attrNames.nextElement();
          if(cleanupAfterInclude || attrName.startsWith("org.springframework.web.servlet"))
              attrsToCheck.add(attrName);
      } while(true);
      attrsToCheck.addAll(attributesSnapshot.keySet());
      Iterator iterator = attrsToCheck.iterator();
      do
      {
          if(!iterator.hasNext())
              break;
          String attrName = (String)iterator.next();
          Object attrValue = attributesSnapshot.get(attrName);
          if(attrValue == null)
              request.removeAttribute(attrName);
          else
          if(attrValue != request.getAttribute(attrName))
              request.setAttribute(attrName, attrValue);
      } while(true);
  }
  
  private static String getRequestUri(HttpServletRequest request)
  {
    String uri = (String)request.getAttribute("javax.servlet.include.request_uri");
    if (uri == null) {
      uri = request.getRequestURI();
    }
    return uri;
  }
  
  public DispatcherServlet() {}
}
