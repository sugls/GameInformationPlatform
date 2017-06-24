package community.dao;

import community.dto.*;
import community.dto.Thread;
import org.json.JSONObject;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

/**
 *
 * Created by lsc on 2017/5/22.
 */
public class CommunityDaoImplTest {
    private ICommunityDao dao;
    @Before
    public void setUp() throws Exception {
        dao = new CommunityDaoImpl();
    }

    @After
    public void tearDown() throws Exception {
        dao = null;
    }

    @Test
    public void checkLogin() throws Exception {
        System.out.println(dao.checkLogin(new Userinfo("sugl","123456")));
    }

    @Test
    public void isAvailableUsername() throws Exception {

    }

    @Test
    public void getForums() throws Exception {
        List<Forum> forums = dao.getForum();
        for (Forum f :
                forums) {
            System.out.println(f);
        }
    }

    @Test
    public void getThreads() throws Exception {
        List<Thread> threads = dao.getHotThreads(2,20);
        for (Thread t :
                threads) {
            System.out.println(t);
        }
    }

    @Test
    public void getThreadPostByTidTest() throws Exception {
        System.out.println(dao.getThreadPostByTid(1));
    }

    @Test
    public void getPostsRepliesByTid() throws Exception {
        List<Post> posts = dao.getPostsRepliesByTid(1,1,5,2);
        for (Post post:
                posts){
            System.out.println(post);
            System.out.println(post.getReplyNum());
            System.out.println(post.getReplies());
        }
    }

    @Test
    public void getPostsTotalPagesByTid() throws Exception {
        System.out.println(dao.getPostsTotalPagesByTid(1,4));
    }

    @Test
    public void getRepliesTotalRecordsByPid() throws Exception {
        System.out.println(dao.getRepliesTotalRecordsByPid(3));
    }

    @Test
    public void getRepliesTotalPagesByPidTest() throws Exception {
        System.out.println(dao.getRepliesTotalPagesByPid(2,1));
    }

    @Test
    public void getRepliesByPidTest() throws Exception {
        List<Reply> replies = dao.getRepliesByPid(2,1,3);
        for (Reply r :
                replies) {
            System.out.println(r);
        }
    }

    @Test
    public void getMemberInfo() throws Exception {
        Member member = dao.getMemberById(1);
        String result = new JSONObject(member).toString();
        System.out.println(result);
    }

    @Test
    public void insertPostTest() throws Exception {
        Post post = new Post();

        // insert into post(fid,tid,author,authorid,dateline,message,userip,isFirst)
        // values(1,2,'kakaxi',2,current_timestamp(),'reply test1','192.168.0.1',false);

        post.setFid(1);
        post.setTid(2);
        post.setAuthor("sugl");
        post.setAuthorid(1);
        post.setMessage("reply test2");
        post.setUserip("127.0.0.1");
        post.setFirst(false);
    }

    @Test
    public void registerUserTest() throws Exception {
        Userinfo u = new Userinfo("qqq","123456");
        System.out.println(dao.registerUser(u));
        System.out.println(u.getUserid());
    }

    @Test
    public void updateUserInfoTest() throws Exception {

        Userinfo u = new Userinfo();
        u.setUserid(3);
        u.setIcon("3.jpg");
        System.out.println(dao.updateUserInfo(u));
    }
}
