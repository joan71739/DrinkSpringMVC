package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

// 等同於mvc-servlet.xml

@Configuration	// 我是組態檔
@EnableWebMvc  	// 等同於 <mvc:annotation-driven/>
@ComponentScan(basePackages = {"activity","tw.billhu","tw.store","tw.login","tw.mail","tw.kuziwu"})   //*** 等同於 <context:component-scan base-package="tw.leonchen"/>
public class SpringMVCJavaConfig implements WebMvcConfigurer {
	
	// 必加。幫助 Bean 的註冊、運作
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable(); 
	}
	
	// InternalResourceViewResolver: return 可以加上前置、後置字串
	/* 這功能暫時不使用
	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setPrefix("/WEB-INF/pages/");
		viewResolver.setSuffix(".jsp");
		viewResolver.setOrder(2);
		return viewResolver;
	}
	*/
	
	//*** 靜態資源處理(路徑到時候要改)
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/storeImages/**").addResourceLocations("storePages/storeImages/");
//		registry.addResourceHandler("/StoreIMG/**").addResourceLocations("storePages/StoreIMG/");
		registry.addResourceHandler("/storeCss/**").addResourceLocations("storePages/storeCss/");
	}
	
	//*** 特定網址重導設定(路徑到時候要改)
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("redirect:membersEntry.controller");
	}
	
	// 提供上傳檔案功能，並固定以 UTF-8 編碼方式
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver cmpartResolver = new CommonsMultipartResolver();
		cmpartResolver.setDefaultEncoding("UTF-8");
		return cmpartResolver;
	}
	
}
