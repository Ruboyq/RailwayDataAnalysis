package org.rda.test;



import org.junit.Test;
import org.rda.service.SpiderService;
import org.rda.utils.SpiderUtil;
import org.springframework.beans.factory.annotation.Autowired;


public class ServiceTest extends BaseTest{
	
	@Autowired
	private SpiderService ss;
	@Test
	public void test(){
		SpiderUtil test=new SpiderUtil();
		test.scratch();
		//ss.setSpiderPath("D:\\Spider", "D:\\Spider", "D:\\Spider", "D:\\Spider", "D:\\Spider");
		//ss.startSpider();
		/*JSONArray jsonArray=dataAnalyzeService.getToCityReceiptNum("201601", "201612", 18);
		  for(int i=0;i<jsonArray.size();i++){  
			  // 遍历 jsonarray 数组，把每一个对象转成 json 对象  
			 JSONObject job = jsonArray.getJSONObject(i);
			 if((Double)job.get("count") >= 0.9){
				 System.out.println(job.get("lat"));
				 System.out.println(job.get("count"));
			 }
			 System.out.println(job.get("lat"));
			 System.out.println(job.get("count"));
		  }*/
		/*JSONObject analysisRes = dataAnalyzeService.getFilterResult("", "北京");
		System.out.println(analysisRes.toString());*/
		/*List<RailwayCity> rc = dataAnalyzeService.getAllCenterPairs();
		for(RailwayCity r:rc){
			System.out.println(r.getFromCity());
		}*/
		/*List<City> rc = rds.getOriginalCitys();
		for(City c:rc){
			System.out.println(c.getIsCenter());
		}*/
		
		/*JSONObject jsonObject=dataAnalyzeService.getCarNumInCompany();
		System.out.println(jsonObject.toString());*/
		/*JSONObject jsonObject1=dataAnalyzeService.getCarNumInTotal();
		System.out.println(jsonObject1.toString());*/
		//bds.createProvinceTable();
	}
}
