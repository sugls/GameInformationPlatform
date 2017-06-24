package community.dao;

import community.dto.*;
import community.dto.Thread;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import util.MybatisSqlSessionFactory;

import java.util.Base64;
import java.util.List;

/**
 *
 * Created by lsc on 2017/5/22.
 */
public class CommunityDaoImpl implements ICommunityDao{

    @Override
    public Userinfo checkLogin(Userinfo u) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        Userinfo user = session.selectOne("checklogin",u);
        MybatisSqlSessionFactory.closeSqlSession();
        return user;
    }

    @Override
    public boolean isAvailableUsername(String username) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        Integer id = session.selectOne("isAvailableUsername",username);
        MybatisSqlSessionFactory.closeSqlSession();
        return id==null;
    }

    @Override
    public Boolean registerUser(Userinfo u) {
        boolean result = false;
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        Integer i = session.insert("insertUser",u);

        if (i==0){
            return false;
        }
        Integer i2 = session.insert("insertMember",new Member(u.getUserid(),u.getUsername()));
        if (i2!=0){
            session.commit();
            result = true;
        }
        MybatisSqlSessionFactory.closeSqlSession();
        return result;
    }

    @Override
    public Member getMemberById(Integer id) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        Member member = session.selectOne("getMemberInfoById",id);
        MybatisSqlSessionFactory.closeSqlSession();
        return member;
    }

    @Override
    public List<Forum> getForum() {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        List<Forum> forums = session.selectList("getForum");
        MybatisSqlSessionFactory.closeSqlSession();
        return forums;
    }

    @Override
    public Forum getForumById(Integer id) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        Forum forum = session.selectOne("getForumById",id);
        MybatisSqlSessionFactory.closeSqlSession();
        return forum;
    }

    @Override
    public List<Thread> getHotThreads(int pages, int pageSize) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        List<Thread> threads = session.selectList("getHotThreads",null,new RowBounds((pages-1)*pageSize,pageSize));
        MybatisSqlSessionFactory.closeSqlSession();
        return threads;
    }

    @Override
    public List<Thread> getNewestThreads(int pages, int pageSize) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        List<Thread> threads = session.selectList("getNewestThreads",null,new RowBounds((pages-1)*pageSize,pageSize));
        MybatisSqlSessionFactory.closeSqlSession();
        return threads;
    }

    @Override
    public Thread getThreadById(Integer tid) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        Thread thread = session.selectOne("getThreadById",tid);
        MybatisSqlSessionFactory.closeSqlSession();
        return thread;
    }

    @Override
    public Post getThreadPostByTid(Integer tid) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        Post post = session.selectOne("getThreadPost",tid);
        MybatisSqlSessionFactory.closeSqlSession();
        return  post;
    }

    @Override
    public List<Post> getPostsRepliesByTid(Integer tid, int pages, int pageSize,int replyPageSize) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        List<Post> posts = session.selectList("queryPostsByThreadId",tid,new RowBounds((pages-1)*pageSize,pageSize));

        for (Post p:
             posts) {
            p.setReplyNum(getRepliesTotalRecordsByPid(p.getPid()));
            p.setReplies(getRepliesByPid(p.getPid(),1,replyPageSize));
        }

        MybatisSqlSessionFactory.closeSqlSession();
        return posts;
    }

    @Override
    public Integer getPostsTotalRecordsByTid(Integer tid) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        Integer i = session.selectOne("countPostsByThreadId",tid);
        MybatisSqlSessionFactory.closeSqlSession();
        return i;
    }

    @Override
    public Integer getPostsTotalPagesByTid(Integer i, int pageSize) {
        if (i != null){
            return  (i % pageSize == 0)? (i / pageSize) : (i/pageSize+1);
        } else {
            return null;
        }
    }

    @Override
    public Integer getRepliesTotalRecordsByPid(Integer pid) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        Integer i = session.selectOne("countRepliesByPid",pid);
        MybatisSqlSessionFactory.closeSqlSession();
        return  i;
    }

    @Override
    public Integer getRepliesTotalPagesByPid(Integer i, int pageSize) {
        if (i != null){
            return  (i % pageSize == 0)? (i / pageSize) : (i/pageSize+1);
        } else {
            return null;
        }
    }

    @Override
    public List<Reply> getRepliesByPid(Integer pid, int pages, int pageSize) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        List<Reply> replies = session.selectList("queryRepliesByPostId",pid,new RowBounds((pages-1)*pageSize,pageSize));
        MybatisSqlSessionFactory.closeSqlSession();
        return  replies;
    }

    @Override
    public Boolean replyAThread(Post post) {
        boolean result = false;
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        int i = session.insert("putAPost",post);
        if (i!=0){
            int fi = session.update("updateForumPost",post.getFid());
            int mi = session.update("updateMemberReplies",post.getAuthorid());
            int ti = session.update("updateThreadReplies",post.getTid());
            result = true;
            session.commit();
        }
        MybatisSqlSessionFactory.closeSqlSession();
        return result;
    }

    @Override
    public Boolean postAThread(Thread thread, Post post) {
        boolean result = false;
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        int i = session.insert("insertThread",thread);
        if (i!=0){
            Thread t = session.selectOne("getThreadById",thread.getTid());
            //fid,tid,author,authorid,dateline,message,userip,isFirst
            post.setTid(t.getTid());
            session.insert("putAPost",post);
            int fi = session.update("updateForumThread",thread.getFid());
            int mi = session.update("updateMemberPosts",thread.getAuthorid());
            result = true;
            session.commit();
        }
        MybatisSqlSessionFactory.closeSqlSession();
        return result;
    }

    @Override
    public Boolean updateThreadViews(int tid) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        int i = session.insert("updateThreadViews",tid);
        MybatisSqlSessionFactory.closeSqlSession();
        return i!=0;
    }

    @Override
    public List<Thread> getNewestThreadsByFid(int fid, int pages, int pageSize) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        List<Thread> threads = session.selectList("getNewestThreadsByFid",fid,new RowBounds((pages-1)*pageSize,pageSize));
        MybatisSqlSessionFactory.closeSqlSession();
        return threads;
    }

    @Override
    public List<Thread> getHotThreadsByFid(int fid, int pages, int pageSize) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        List<Thread> threads = session.selectList("getHotThreadsByFid",fid,new RowBounds((pages-1)*pageSize,pageSize));
        MybatisSqlSessionFactory.closeSqlSession();
        return threads;
    }

    @Override
    public List<Member> getTopActivesMember(int limit) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        List<Member> members = session.selectList("getTopActivesMember",limit);
        MybatisSqlSessionFactory.closeSqlSession();
        return members;
    }

    @Override
    public Userinfo updateUserInfo(Userinfo u) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        int i = session.update("updateUser",u);
        if (i!=0){
            session.commit();
            Userinfo newUser = session.selectOne("getUserById",u.getUserid());
            MybatisSqlSessionFactory.closeSqlSession();
            return newUser;
        }
        MybatisSqlSessionFactory.closeSqlSession();
        return null;
    }

    @Override
    public Userinfo getUserById(Integer userid) {
        SqlSession session = MybatisSqlSessionFactory.getSqlSession();
        Userinfo u = session.selectOne("getUserById",userid);
        MybatisSqlSessionFactory.closeSqlSession();
        return u;
    }
}
