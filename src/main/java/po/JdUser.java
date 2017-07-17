package po;

import org.hibernate.validator.constraints.NotEmpty;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class JdUser {
    private Integer uId;
    @Pattern(regexp="\\w{7,7}",message="{user.name.error}")
    private String name;

    @Pattern(regexp="^[A-Za-z0-9\\u4e00-\\u9fa5]+@[a-zA-Z0-9_-]+(\\.[a-zA-Z0-9_-]+)+$",message="{user.email.error}")
    private String email;

    @Pattern(regexp="^1[3|4|5|7|8][0-9]{9}$",message="{user.phone.error}")
    private String phoneNumber;

    @Pattern(regexp="\\w{6,6}",message="{user.pass.error}")
    private String pass;

    private String state;

    private Float money;

    private String acticode;

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber == null ? null : phoneNumber.trim();
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass == null ? null : pass.trim();
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    public Float getMoney() {
        return money;
    }

    public void setMoney(Float money) {
        this.money = money;
    }

    public String getActicode() {
        return acticode;
    }

    public void setActicode(String acticode) {
        this.acticode = acticode == null ? null : acticode.trim();
    }
}