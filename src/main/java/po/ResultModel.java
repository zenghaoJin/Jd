package po;

import java.util.List;

/**
 * Created by 曾浩津 on 2017/9/19.
 */
public class ResultModel {
    //商品列表
    private List<ProdModel> prodList;
    //商品总数
    private Long recordCount;
    //总页数
    private Long pageCount;
    //当前页
    private int curPage;
    public List<ProdModel> getProdList() {
        return prodList;
    }

    public void setProdList(List<ProdModel> prodList) {
        this.prodList = prodList;
    }

    public Long getRecordCount() {
        return recordCount;
    }

    public void setRecordCount(Long recordCount) {
        this.recordCount = recordCount;
    }

    public Long getPageCount() {
        return pageCount;
    }

    public void setPageCount(Long pageCount) {
        this.pageCount = pageCount;
    }

    public int getCurPage() {
        return curPage;
    }

    public void setCurPage(int curPage) {
        this.curPage = curPage;
    }
}
