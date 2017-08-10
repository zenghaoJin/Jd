package po;

public class JdThreeclass {
    private Integer thid;

    private String name;

    private Integer tid;

    public Integer getThid() {
        return thid;
    }

    public void setThid(Integer thid) {
        this.thid = thid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }
}