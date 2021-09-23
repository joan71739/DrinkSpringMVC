package config;

import java.util.Properties;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.jndi.JndiObjectFactoryBean;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

//等同於beans.config.xml
@Configuration
@ComponentScan(basePackages = { "activity","tw.billhu","tw.store","tw.login","tw.mail","tw.kuziwu" }) //*** Bean 元件生效範圍
@EnableTransactionManagement
@EnableAspectJAutoProxy  // 忘記是幹嘛的
public class RootAppConfig {
	
	// 註冊JNDI連線 Bean
    @Bean
	public DataSource dataSource() throws IllegalArgumentException, NamingException {
		JndiObjectFactoryBean jndiBean = new JndiObjectFactoryBean();
		jndiBean.setJndiName("java:comp/env/connectSqlServerJdbc/MyService");
		jndiBean.afterPropertiesSet();
		DataSource ds = (DataSource) jndiBean.getObject();
		return ds;
	}
    
    //*** 註冊 Bean: Hibernate 設定( 注意:內有Scan範圍)
    @Bean(destroyMethod = "destroy")
    public LocalSessionFactoryBean sessionFactory() throws IllegalArgumentException, NamingException {
    	LocalSessionFactoryBean factory = new LocalSessionFactoryBean();
    	factory.setDataSource(dataSource());
    	factory.setPackagesToScan(new String[] {"activity","tw.billhu","tw.store","tw.login","tw.mail","tw.kuziwu"});
    	factory.setHibernateProperties(addProperties());
    	return factory;
    }
	private Properties addProperties() {
		Properties props = new Properties();
		props.put("hibernate.dialect", org.hibernate.dialect.SQLServerDialect.class);
		props.put("hibernate.show_sql", Boolean.TRUE);
		props.put("hibernate.format_sql", Boolean.TRUE);
//		props.put("hibernate.current_session_context_class", "thread");
		// 2021/8/3 增加
		props.put("hibernate.allow_update_outside_transaction", Boolean.TRUE);
		return props;
	}
	
	// 交易管理員註冊 Bean
	
	@Bean(name="transactionManager") 
	@Autowired
	public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager txMgr = new HibernateTransactionManager();
		txMgr.setSessionFactory(sessionFactory);
		return txMgr;
	}
	
}
