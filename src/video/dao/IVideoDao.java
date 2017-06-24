package video.dao;

import video.dto.Author;
import video.dto.Video;

import java.util.List;

/**
 *
 * Created by lsc on 2017/5/29.
 */
public interface IVideoDao {

    /**
     * 获取最新视频列表
     * @param pages 当前页数
     * @return Video List
     */
    List<Video> getNewestVideoList(int pages);

    /**
     * 获取视频作者信息列表
     * @return Author List
     */
    List<Author> getAuthorList();

    /**
     * 根据视频作者Id获取视频列表
     * @param authorid 视频作者Id
     * @param pages 当前页数
     * @return Video List
     */
    List<Video> getAuthorVideoList(int authorid, int pages);

    /**
     * 根据关键字搜索视频列表
     * @param keyword 关键字
     * @param pages 当前页数
     * @return Video List
     */
    List<Video> getVideoListByKeyword(String keyword, int pages);

    /**
     * 根据英雄Id获取视频列表
     * @param hero 英雄Id
     * @param pages 当前页数
     * @return Video List
     */
    List<Video> getVideoListByHero(int hero, int pages);

}
