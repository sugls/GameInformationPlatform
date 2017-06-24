package util;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

/**
 * 获取SqlSession实例
 * Created by lsc on 2017/5/21.
 */
public class MybatisSqlSessionFactory {

    private static SqlSessionFactory factory;
    private static ThreadLocal<SqlSession> sqlSessionThreadLocal = new ThreadLocal<>();

    static {
        factory = buildSqlSessionFactory();
    }

    private static SqlSessionFactory buildSqlSessionFactory(){
        InputStream inputStream = null;
        String configFile = "mybatisconfig.xml";
        try {
            inputStream = Resources.getResourceAsStream(configFile);
            factory = new SqlSessionFactoryBuilder().build(inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (inputStream != null){
                try {
                    inputStream.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        return factory;
    }

    public static SqlSession getSqlSession(){
        SqlSession sqlSession = sqlSessionThreadLocal.get();
        if(sqlSession == null){
            if(factory == null){
                factory = buildSqlSessionFactory();
            }
            assert factory != null;
            sqlSession = factory.openSession();
            sqlSessionThreadLocal.set(sqlSession);
        }
        return sqlSession;
    }

    public static void closeSqlSession(){
        SqlSession sqlSession = sqlSessionThreadLocal.get();
        if(sqlSession != null){
            sqlSession.close();
            sqlSessionThreadLocal.remove();
        }
    }

}
