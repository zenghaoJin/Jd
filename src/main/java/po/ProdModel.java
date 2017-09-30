package po;

/**
 * Created by 曾浩津 on 2017/9/19.
 */
public class ProdModel {
    //商品id
    private String proid;
    //商品名字
    private String prod_name;
    //商品价格
    private String prod_price;
    //商品的主图
    private String prod_zimg;
    //商品的款式图
    private String[] img;
    //商品品牌
    private String brand;
    //主分类
    private String mid;
    //子分类
    private String tid;
    //子子分类
    private String thid;
    //商品信息
    private String promessage;
    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getThid() {
        return thid;
    }

    public void setThid(String thid) {
        this.thid = thid;
    }

    public String getPromessage() {
        return promessage;
    }

    public void setPromessage(String promessage) {
        this.promessage = promessage;
    }

    public String getProid() {
        return proid;
    }

    public void setProid(String proid) {
        this.proid = proid;
    }

    public String getProd_name() {
        return prod_name;
    }

    public void setProd_name(String prod_name) {
        this.prod_name = prod_name;
    }

    public String getProd_price() {
        return prod_price;
    }

    public void setProd_price(String prod_price) {
        this.prod_price = prod_price;
    }

    public String getProd_zimg() {
        return prod_zimg;
    }

    public void setProd_zimg(String prod_zimg) {
        this.prod_zimg = prod_zimg;
    }

    public String[] getImg() {
        return img;
    }

    public void setImg(String[] img) {
        this.img = img;
    }
}
