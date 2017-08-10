package po;

public class JdProdimg {
    private Integer pimgid;

    private String img;

    private String iname;

    private Integer proid;

    public Integer getPimgid() {
        return pimgid;
    }

    public void setPimgid(Integer pimgid) {
        this.pimgid = pimgid;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public String getIname() {
        return iname;
    }

    public void setIname(String iname) {
        this.iname = iname == null ? null : iname.trim();
    }

    public Integer getProid() {
        return proid;
    }

    public void setProid(Integer proid) {
        this.proid = proid;
    }
}