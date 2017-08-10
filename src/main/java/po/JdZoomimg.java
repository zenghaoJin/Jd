package po;

public class JdZoomimg {
    private Integer zoomimgid;

    private String img;

    private Integer pimgid;

    public Integer getZoomimgid() {
        return zoomimgid;
    }

    public void setZoomimgid(Integer zoomimgid) {
        this.zoomimgid = zoomimgid;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public Integer getPimgid() {
        return pimgid;
    }

    public void setPimgid(Integer pimgid) {
        this.pimgid = pimgid;
    }
}