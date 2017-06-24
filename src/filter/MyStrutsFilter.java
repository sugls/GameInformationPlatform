package filter;

import org.apache.log4j.Logger;
import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;
import sun.rmi.runtime.Log;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

/**
 *
 * Created by lsc on 2017/5/21.
 */
@WebFilter(filterName = "MyStrutsFilter")
public class MyStrutsFilter extends StrutsPrepareAndExecuteFilter {

    private Logger log = Logger.getLogger(MyStrutsFilter.class);

    @Override
    public void doFilter(ServletRequest req, ServletResponse res,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) req;
        String url = request.getRequestURI();
       // System.out.println(url);
        if (url.contains("/ueditor/jsp/")) {
          //  log.info("Struts 使用自定义过滤器");
            chain.doFilter(req, res);
        }else{
         //   log.info("Struts 使用默认过滤器");
            super.doFilter(req, res, chain);
        }
    }

}
