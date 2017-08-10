package po;

import javax.validation.constraints.Pattern;

public class JdProds {
    private Integer proid;
    @Pattern(regexp="[\\u4e00-\\u9fa5_a-zA-Z0-9_]{1,10}",message="{jdProds.name.error}")
    private String name;
    @Pattern(regexp="[\\u4e00-\\u9fa5_a-zA-Z0-9_]{1,10}",message="{jdProds.brand.error}")
    private String brand;
    @Pattern(regexp="[\\u4e00-\\u9fa5_a-zA-Z0-9_]{1,100}",message="{jdProds.proMessage.error}")
    private String promessage;
    @Pattern(regexp="^[0-9]+(.[0-9]+)?$",message="{jdProds.price.error}")
    private String price;
    @Pattern(regexp="^(\\d|[1-9]\\d|100)$",message="{jdProds.discount.error}")
    private String discount;

    private Integer stoid;

    private String zimg;

    private Integer thid;

    public Integer getProid() {
        return proid;
    }

    public void setProid(Integer proid) {
        this.proid = proid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand == null ? null : brand.trim();
    }

    public String getPromessage() {
        return promessage;
    }

    public void setPromessage(String promessage) {
        this.promessage = promessage == null ? null : promessage.trim();
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price == null ? null : price.trim();
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount == null ? null : discount.trim();
    }

    public Integer getStoid() {
        return stoid;
    }

    public void setStoid(Integer stoid) {
        this.stoid = stoid;
    }

    public String getZimg() {
        return zimg;
    }

    public void setZimg(String zimg) {
        this.zimg = zimg == null ? null : zimg.trim();
    }

    public Integer getThid() {
        return thid;
    }

    public void setThid(Integer thid) {
        this.thid = thid;
    }
}