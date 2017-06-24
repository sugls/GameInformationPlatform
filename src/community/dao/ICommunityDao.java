package community.dao;

import community.dto.*;
import community.dto.Thread;

import java.util.List;

/**
 *
 * Created by lsc on 2017/5/22.
 */
public interface ICommunityDao {

    /**
     * 登陆验证
     */
    Userinfo checkLogin(Userinfo u);

    /**
     * 验证用户名是否重复
     */
    boolean isAvailableUsername(String username);


    /**
     * 用户注册 insert userinfo，insert into member
     */
    Boolean registerUser(Userinfo u);


    /**
     * 查询 论坛 用户 详细信息 by id
     */
    Member getMemberById(Integer id);


    /**
     * 查询版块
     */
    List<Forum> getForum();

    /**
     * 通过 id 查询版块
     */
    Forum getForumById(Integer id);


    /**
     * 通过 id 查询 帖子主题
     */
    Thread getThreadById(Integer tid);


    /**
     * 查询 热门 帖子
     */
    List<Thread> getHotThreads(int pages, int pageSize);

    /**
     * 查询 最新 帖子
     */
    List<Thread> getNewestThreads(int pages, int pageSize);


    /**
     * 查询 Thread Post
     */

    Post getThreadPostByTid(Integer tid);

    /**
     * 分页查询 PostsReplies By ThreadId
     */
    List<Post> getPostsRepliesByTid(Integer tid, int pages, int pageSize, int replyPageSize);

    /**
     * 获取 Posts 总记录数
     */
    Integer getPostsTotalRecordsByTid(Integer tid);

    /**
     * 获取 Posts 总页数
     */
    Integer getPostsTotalPagesByTid(Integer i, int pageSize);

    /**
     * 获取 replies 总记录数 by postid
     */
    Integer getRepliesTotalRecordsByPid(Integer pid);

    /**
     * 获取 replies 总页数 by postid
     */
    Integer getRepliesTotalPagesByPid(Integer i, int pageSize);

    /**
     * 分页查询 replies by postid
     */
    List<Reply> getRepliesByPid(Integer pid, int pages, int pageSize);


    /**
     * 回复 一条 Thread
     */
    Boolean replyAThread(Post post);

    /**
     * 发贴
     */
    Boolean postAThread(Thread thread, Post post);

    /**
     * 阅读数 加一
     */
    Boolean updateThreadViews(int tid);

    /**
     * 分页 获取 最新 thread list by fid
     */
    List<Thread> getNewestThreadsByFid(int fid, int pages, int pageSize);

    /**
     * 分页 获取 最热 thread list by  fid
     */
    List<Thread> getHotThreadsByFid(int fid, int pages, int pageSize);

    /**
     * 获取 用户 活跃榜
     * @param limit 前 8 位
     * @return member list
     */
    List<Member> getTopActivesMember(int limit);

    /**
     * 更新用户 信息
     * @param u 需要更新的用户信息
     * @return 更新之后的用户对象
     */
    Userinfo updateUserInfo(Userinfo u);

    /**
     * 根据用户Id获取用户对象
     * @param userid 用户Id
     * @return 用户对象
     */
    Userinfo getUserById(Integer userid);

}
