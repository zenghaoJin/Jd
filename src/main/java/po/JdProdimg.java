package po;

public class JdProdimg {
    private Integer pimgId;

    private String img;

    private String iname;

    private Integer proId;

    public Integer getPimgId() {
        return pimgId;
    }

    public void setPimgId(Integer pimgId) {
        this.pimgId = pimgId;
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

    public Integer getProId() {
        return proId;
    }

    public void setProId(Integer proId) {
        this.proId = proId;
    }
}