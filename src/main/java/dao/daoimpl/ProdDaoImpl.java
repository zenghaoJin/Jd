package dao.daoimpl;

import dao.ProdDao;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import po.ProdModel;
import po.ResultModel;

import javax.management.Query;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by 曾浩津 on 2017/9/19.
 */
@Repository
public class ProdDaoImpl implements ProdDao{
    @Autowired
    private SolrServer solrServer;
    @Override
    public ResultModel queryProd(SolrQuery solrQuery) throws Exception {
        //查询并获取查询响应
        QueryResponse queryResponse = solrServer.query(solrQuery);
        //从响应中获取查询结果
        SolrDocumentList doList = queryResponse.getResults();
        //创建返回结果集
        ResultModel resultModel = new ResultModel();
        List<ProdModel> prodModelList= new ArrayList<>();
        //遍历结果集
        if(doList!=null){
            //获取总记录数
            resultModel.setRecordCount(doList.getNumFound());
            System.out.println("---------------------"+doList.getNumFound());
            for (SolrDocument doc : doList){
                ProdModel prodModel = new ProdModel();
                prodModel.setProid(String.valueOf(doc.get("id")));
                prodModel.setProd_zimg(String.valueOf(doc.get("prod_zimg")));
                prodModel.setProd_price(String.valueOf(doc.get("prod_price")));
                //获取高亮
                Map<String,Map<String,List<String>>> highlighting = queryResponse.getHighlighting();
                if(highlighting!=null){
                    List<String> list = highlighting.get(doc.get("id")).get("prod_name");
                    if(list != null && list.size()>0){
                        prodModel.setProd_name(list.get(0));
                    }else{
                        prodModel.setProd_name(String.valueOf(doc.get("prod_name")));
                    }
                }else{
                    prodModel.setProd_name(String.valueOf(doc.get("prod_name")));
                }
                //设置款式图
                if(doc.get("img")!=null){
                    String img = (String) doc.get("img").toString();
                    img = img.substring(1, img.length()-1);
                    String[] val = img.split(",");
                    for(int i=0;i<val.length;i++){
                        val[i] = val[i].trim();
                    }
                    prodModel.setImg(val);
                }
                prodModelList.add(prodModel);
            }
            resultModel.setProdList(prodModelList);
        }
        return resultModel;
    }

    @Override
    public void delectProd(String id) throws Exception {
        if(id!=null) {
            solrServer.deleteById(id);
        }
        solrServer.commit();
    }

    @Override
    public void updateProd(ProdModel prodModel) throws Exception {
        SolrInputDocument doc = new SolrInputDocument();
        doc.addField("id",prodModel.getProid());
        doc.addField("prod_name",prodModel.getProd_name());
        doc.addField("prod_price",prodModel.getProd_price());
        doc.addField("prod_brand",prodModel.getBrand());
        doc.addField("prod_promessage",prodModel.getPromessage());
        doc.addField("prod_zimg",prodModel.getProd_zimg());
        if(prodModel.getMid()!=null){
            doc.addField("mid",prodModel.getMid());
        }
        if(prodModel.getTid()!=null){
            doc.addField("tid",prodModel.getTid());
        }
        if(prodModel.getThid()!=null){
            doc.addField("thid",prodModel.getThid());
        }
        if(prodModel.getImg()!=null&&prodModel.getImg().length>0){
            for(int i=0;i<prodModel.getImg().length;i++){
                doc.addField("img",prodModel.getImg()[i]);
            }
        }
        solrServer.add(doc);
        solrServer.commit();
    }
}
