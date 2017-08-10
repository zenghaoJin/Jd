package po;

import javax.validation.constraints.Pattern;

public class JdStores {
    private Integer stoid;

    private String name;
    @Pattern(regexp="\\w{6,6}",message="{stop.pass.error}")
    private String pass;
    @Pattern(regexp="\\w{7,7}",message="{stop.name.error}")
    private String pname;

    public Integer getStoid() {
        return stoid;
    }

    public void setStoid(Integer stoid) {
        this.stoid = stoid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass == null ? null : pass.trim();
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname == null ? null : pname.trim();
    }
}