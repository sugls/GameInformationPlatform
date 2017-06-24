package video.dao;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import video.dto.Author;
import video.dto.Video;

import java.util.List;

import static org.junit.Assert.*;

/**
 *
 * Created by lsc on 2017/5/29.
 */
public class VideoDaoImplTest {
    private IVideoDao videoDao;
    @Before
    public void setUp() throws Exception {
        videoDao = new VideoDaoImpl();
    }

    @After
    public void tearDown() throws Exception {
        videoDao = null;
    }

    @Test
    public void getNewestVideoList() throws Exception {
         List<Video> videoList = videoDao.getNewestVideoList(1);
        for (Video v :
                videoList) {
            System.out.println(v);
        }
    }

    @Test
    public void getAuthorListTest() throws Exception {
        List<Author> authors = videoDao.getAuthorList();
        System.out.println(authors.size());
        for (Author a: authors){
            System.out.println(a);
        }
    }

    @Test
    public void getAuthorVideoListTest() throws Exception {
        List<Video> videoList = videoDao.getAuthorVideoList(1,1);
        for (Video v :
                videoList) {
            System.out.println(v);
        }
    }

    @Test
    public void getVideoListByKeywordTest() throws Exception {
        List<Video> videoList = videoDao.getVideoListByKeyword("小楼",1);
        System.out.println(videoList.size());
        for (Video v :
                videoList) {
            System.out.println(v);
        }
    }

    @Test
    public void getVideoListByHeroTest() throws Exception {

        List<Video> videoList = videoDao.getVideoListByHero(102,1);
        System.out.println(videoList.size());
        for (Video v :
                videoList) {
            System.out.println(v);
        }
    }
}