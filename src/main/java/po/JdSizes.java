package po;

public class JdSizes {
    private Integer sizeId;

    private String size;

    private String number;

    private Integer proiId;

    public Integer getSizeId() {
        return sizeId;
    }

    public void setSizeId(Integer sizeId) {
        this.sizeId = sizeId;
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

    public Integer getProiId() {
        return proiId;
    }

    public void setProiId(Integer proiId) {
        this.proiId = proiId;
    }
}