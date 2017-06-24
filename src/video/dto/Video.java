package video.dto;

import java.io.Serializable;

/**
 *
 * Created by lsc on 2017/5/29.
 */
public class Video implements Serializable{
    private String guid;
    private String vid;
    private String title;
    private String bigimg;
    private String img;
    private String url;
    private String physicalpath;
    private String virtualpath;
    private String content;
    private String tag;
    private String createdate;
    private String catalog;
    private Author author;
    private String source;
    private String comments;

    public String getGuid() {
        return guid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    public String getVid() {
        return vid;
    }

    public void setVid(String vid) {
        this.vid = vid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getBigimg() {
        return bigimg;
    }

    public void setBigimg(String bigimg) {
        this.bigimg = bigimg;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getPhysicalpath() {
        return physicalpath;
    }

    public void setPhysicalpath(String physicalpath) {
        this.physicalpath = physicalpath;
    }

    public String getVirtualpath() {
        return virtualpath;
    }

    public void setVirtualpath(String virtualpath) {
        this.virtualpath = virtualpath;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getCreatedate() {
        return createdate;
    }

    public void setCreatedate(String createdate) {
        this.createdate = createdate;
    }

    public String getCatalog() {
        return catalog;
    }

    public void setCatalog(String catalog) {
        this.catalog = catalog;
    }

    public Author getAuthor() {
        return author;
    }

    public void setAuthor(Author author) {
        this.author = author;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    @Override
    public String toString() {
        return "Video{" +
                "guid='" + guid + '\'' +
                ", vid='" + vid + '\'' +
                ", title='" + title + '\'' +
                ", bigimg='" + bigimg + '\'' +
                ", img='" + img + '\'' +
                ", url='" + url + '\'' +
                ", physicalpath='" + physicalpath + '\'' +
                ", virtualpath='" + virtualpath + '\'' +
                ", content='" + content + '\'' +
                ", tag='" + tag + '\'' +
                ", createdate='" + createdate + '\'' +
                ", catalog='" + catalog + '\'' +
                ", author=" + author +
                ", source='" + source + '\'' +
                ", comments=" + comments +
                '}';
    }
}
