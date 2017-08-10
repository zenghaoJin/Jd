package po;

public class JdSizes {
    private Integer sizeid;

    private String size;

    private String number;

    private Integer pimgid;

    public Integer getSizeid() {
        return sizeid;
    }

    public void setSizeid(Integer sizeid) {
        this.sizeid = sizeid;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size == null ? null : size.trim();
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number == null ? null : number.trim();
    }

    public Integer getPimgid() {
        return pimgid;
    }

    public void setPimgid(Integer pimgid) {
        this.pimgid = pimgid;
    }
}