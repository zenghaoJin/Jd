package po;

import javax.validation.constraints.Pattern;

public class JdAdmin {
    private Integer aid;
    @Pattern(regexp="^.{5,10}$",message="{admin.name.error}")
    private String name;
    @Pattern(regexp="^.{5,10}$",message="{admin.pass.error}")
    private String pass;

    public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
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
}