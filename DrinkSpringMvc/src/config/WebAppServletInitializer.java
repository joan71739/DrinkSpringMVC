package config;

import javax.servlet.Filter;

import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

// 等同於web.xml
public class WebAppServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override  //設定等同於 beans.config.xml
	protected Class<?>[] getRootConfigClasses() { 
		return new Class[] {RootAppConfig.class}; 
//		return null;
	}

	@Override  //設定等同於 mvc-servlet.xml
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {SpringMVCJavaConfig.class};
//		return null;
	}

	@Override  // 組態設定套用的區域
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}
	
	
	@Override  // 設定 Filter 來強迫編碼輸入、輸出都是 UTF-8
	protected Filter[] getServletFilters() {
		CharacterEncodingFilter encodeFilter = new CharacterEncodingFilter();
		encodeFilter.setEncoding("UTF-8");
		encodeFilter.setForceEncoding(true);
		return new Filter[] {encodeFilter};
	}	
	
}
