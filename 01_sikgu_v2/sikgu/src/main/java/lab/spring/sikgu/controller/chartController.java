package lab.spring.sikgu.controller;

import java.util.HashMap;
import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import lab.spring.sikgu.model.IncomeVO;
import lab.spring.sikgu.model.MaxIncomeVO;
import lab.spring.sikgu.model.move_incomeVO;
import lab.spring.sikgu.model.total_chartVO;
import lab.spring.sikgu.service.ChartService;

@Controller
public class chartController {

   @Autowired
   HttpSession session;

   @Autowired
   ChartService service;

   @RequestMapping(value = "/chart.do", method = RequestMethod.GET)
   public String form() {
      return "chart";
   }

   @RequestMapping(value="/getPreIncome.do")
   @ResponseBody
   public List<IncomeVO> getMarkers(@RequestBody Map<String, Object> Map) {
      HashMap<String, Object> bounds = (Map instanceof HashMap)? (HashMap<String, Object>) Map : new HashMap<String, Object>(Map);
      List<IncomeVO> IncomeList = service.getPreIncomeChart(bounds);
      return IncomeList;
   }
   
   @RequestMapping(value="/getMoveIncome.do", method = RequestMethod.POST)
   @ResponseBody
   public String getMoveIncomeChart(@RequestBody Map<String, Object> Map) {
      
      String responseS = "[{";
      
      HashMap<String, Object> bounds = (Map instanceof HashMap)? (HashMap<String, Object>) Map : new HashMap<String, Object>(Map);
      List<move_incomeVO> IncomeList = service.getMoveIncome(bounds);
 
            responseS = responseS.concat("\"time\": \"00~06\",");
            responseS = responseS.concat("\"pre_Income\":" + IncomeList.get(0).getT1_income()+",");
            responseS = responseS.concat("\"mov_pop\":" + IncomeList.get(0).getT1_mov_pop() + "}");
            responseS = responseS.concat(",{\"time\": \"06~11\",");
            responseS = responseS.concat("\"pre_Income\":" + IncomeList.get(0).getT2_income()+",");
            responseS = responseS.concat("\"mov_pop\":" + IncomeList.get(0).getT2_mov_pop()+ "}");
            responseS = responseS.concat(",{\"time\": \"11~14\",");
            responseS = responseS.concat("\"pre_Income\":" + IncomeList.get(0).getT3_income()+",");
            responseS = responseS.concat("\"mov_pop\":" + IncomeList.get(0).getT3_mov_pop()+ "}");  
            responseS = responseS.concat(",{\"time\": \"14~17\",");
            responseS = responseS.concat("\"pre_Income\":" + IncomeList.get(0).getT4_income()+",");
            responseS = responseS.concat("\"mov_pop\":" + IncomeList.get(0).getT4_mov_pop()+ "}");
            responseS = responseS.concat(",{\"time\": \"17~21\",");
            responseS = responseS.concat("\"pre_Income\":" + IncomeList.get(0).getT5_income()+",");
            responseS = responseS.concat("\"mov_pop\":" + IncomeList.get(0).getT5_mov_pop()+ "}");
            responseS = responseS.concat(",{\"time\": \"21~24\",");
            responseS = responseS.concat("\"pre_Income\":" + IncomeList.get(0).getT6_income()+",");
            responseS = responseS.concat("\"mov_pop\":" + IncomeList.get(0).getT6_mov_pop()+ "}");
            responseS = responseS.concat("]");             
            System.out.println(responseS);
 
      return responseS;
   }

   
   @RequestMapping(value="/getTotalChart.do", method = RequestMethod.POST)
   @ResponseBody
   public String getTotalChart(@RequestBody Map<String, Object> Map) {
      
      String responseS = "[{";
      
      HashMap<String, Object> bounds = (Map instanceof HashMap)? (HashMap<String, Object>) Map : new HashMap<String, Object>(Map);
      List<total_chartVO> IncomeList = service.getTotalChart(bounds);
      responseS = responseS.concat("\"age\": \"10???\",");
            responseS = responseS.concat("\"pre_Income\":" + IncomeList.get(0).getA1_income()+",");
            responseS = responseS.concat("\"work_pop\":" + IncomeList.get(0).getA1_wor_pop()+",");
            responseS = responseS.concat("\"mov_pop\":" + IncomeList.get(0).getA1_mov_pop() + "},");
            responseS = responseS.concat("{\"age\": \"20???\",");
            responseS = responseS.concat("\"pre_Income\":" + IncomeList.get(0).getA2_income()+",");
            responseS = responseS.concat("\"work_pop\":" + IncomeList.get(0).getA2_wor_pop()+",");
            responseS = responseS.concat("\"mov_pop\":" + IncomeList.get(0).getA2_mov_pop() + "},"); 
            responseS = responseS.concat("{\"age\": \"30???\",");
            responseS = responseS.concat("\"pre_Income\":" + IncomeList.get(0).getA3_income()+",");
            responseS = responseS.concat("\"work_pop\":" + IncomeList.get(0).getA3_wor_pop()+",");
            responseS = responseS.concat("\"mov_pop\":" + IncomeList.get(0).getA3_mov_pop() + "},");
            responseS = responseS.concat("{\"age\": \"40???\",");
            responseS = responseS.concat("\"pre_Income\":" + IncomeList.get(0).getA4_income()+",");
            responseS = responseS.concat("\"work_pop\":" + IncomeList.get(0).getA4_wor_pop()+",");
            responseS = responseS.concat("\"mov_pop\":" + IncomeList.get(0).getA4_mov_pop() + "},");
            responseS = responseS.concat("{\"age\": \"50???\",");
            responseS = responseS.concat("\"pre_Income\":" + IncomeList.get(0).getA5_income()+",");
            responseS = responseS.concat("\"work_pop\":" + IncomeList.get(0).getA5_wor_pop()+",");
            responseS = responseS.concat("\"mov_pop\":" + IncomeList.get(0).getA5_mov_pop() + "},");
            responseS = responseS.concat("{\"age\": \"60???\",");
            responseS = responseS.concat("\"pre_Income\":" + IncomeList.get(0).getA6_income()+",");
            responseS = responseS.concat("\"work_pop\":" + IncomeList.get(0).getA6_wor_pop()+",");
            responseS = responseS.concat("\"mov_pop\":" + IncomeList.get(0).getA6_mov_pop() + "}");
            responseS = responseS.concat("]");
            System.out.println(responseS);
      return responseS;
   }
   
   @RequestMapping(value="/getIncomeAgeRatio.do")
   @ResponseBody
   public String getIncomeAgeRatio(@RequestBody Map<String, Object> Map) {
         
         String responseS = "[{";
         HashMap<String, Object> bounds = (Map instanceof HashMap)? (HashMap<String, Object>) Map : new HashMap<String, Object>(Map);
         List<IncomeVO> IncomeList = service.getIncomeAgeRatio(bounds);
         for(int i =0; i < IncomeList.size(); i++) {
            
           
            if(i == 0) {
              responseS = responseS.concat("\"litres\":" + IncomeList.get(i).getIncome()+",");
              responseS =responseS.concat("\"age\": \"10???\"},");
            } else if (i == 1 ) {
              responseS = responseS.concat("{\"litres\":" + IncomeList.get(i).getIncome()+",");
              responseS =responseS.concat("\"age\": \"20???\"},");
            } else if (i == 2 ) {
             responseS = responseS.concat("{\"litres\":" + IncomeList.get(i).getIncome()+",");
              responseS =responseS.concat("\"age\": \"30???\"},");
            }else if (i == 3) {
             responseS = responseS.concat("{\"litres\":" + IncomeList.get(i).getIncome()+",");
              responseS =responseS.concat("\"age\": \"40???\"},");
            }else if (i == 4 ) {
             responseS = responseS.concat("{\"litres\":" + IncomeList.get(i).getIncome()+",");
              responseS =responseS.concat("\"age\": \"50???\"},");
            }else if (i == 5 ) {
             responseS = responseS.concat("{\"litres\":" + IncomeList.get(i).getIncome()+",");
              responseS = responseS.concat("\"age\": \"60???\"}");
               responseS = responseS.concat("]");
               System.out.println(responseS);
            }
         }
         return responseS;
   }
   
   @RequestMapping(value="/MaxIncome.do", method = RequestMethod.POST)
   @ResponseBody
   public String getIncomeChart(@RequestBody Map<String, Object> Map) {

         String responseS = "[{";
         
         HashMap<String, Object> bounds = (Map instanceof HashMap)? (HashMap<String, Object>) Map : new HashMap<String, Object>(Map);
         List<MaxIncomeVO> MaxIncomeList = service.getMaxIncomeChart(bounds);

         for(int i =0; i < MaxIncomeList.size(); i++) {
            if(MaxIncomeList.get(i).getGubun().equals("t0006")) {
               responseS = responseS.concat("\"category\": \"\",");
               responseS = responseS.concat("\"start\": \"00:00\", \"end\": \"06:00\",");
               responseS = responseS.concat("\"text\": \"????????????" + MaxIncomeList.get(i).getS_NAME().substring(0,2) + " ??????!!\",");
               responseS = responseS.concat("\"textDisabled\": false,");
               responseS = responseS.concat("\"icon\": \"resources/img/markers/" + changeSNameToMarkerName(MaxIncomeList.get(i).getS_NAME()) + ".png\"},");
            } else if(MaxIncomeList.get(i).getGubun().equals("t0611")) {
               responseS = responseS.concat("{\"category\": \"\",");
               responseS = responseS.concat("\"start\": \"06:00\", \"end\": \"11:00\",");
               responseS = responseS.concat("\"text\": \"????????????" + MaxIncomeList.get(i).getS_NAME().substring(0,2) + " ??????!!\",");
               responseS = responseS.concat("\"textDisabled\": false,");
               responseS = responseS.concat("\"icon\": \"resources/img/markers/" + changeSNameToMarkerName(MaxIncomeList.get(i).getS_NAME()) + ".png\"},");
            }  else if(MaxIncomeList.get(i).getGubun().equals("t1114")) {
               responseS = responseS.concat("{\"category\": \"\",");
               responseS = responseS.concat("\"start\": \"11:00\", \"end\": \"14:00\",");
               responseS = responseS.concat("\"text\": \"????????????" + MaxIncomeList.get(i).getS_NAME().substring(0,2) + " ??????!!\",");
               responseS = responseS.concat("\"textDisabled\": false,");
               responseS = responseS.concat("\"icon\": \"resources/img/markers/" + changeSNameToMarkerName(MaxIncomeList.get(i).getS_NAME()) + ".png\"},");
            }  else if(MaxIncomeList.get(i).getGubun().equals("t1417")) {
               responseS = responseS.concat("{\"category\": \"\",");
               responseS = responseS.concat("\"start\": \"14:00\", \"end\": \"17:00\",");
               responseS = responseS.concat("\"text\": \"????????????" + MaxIncomeList.get(i).getS_NAME().substring(0,2) + " ??????!!\",");
               responseS = responseS.concat("\"textDisabled\": false,");
               responseS = responseS.concat("\"icon\": \"resources/img/markers/" + changeSNameToMarkerName(MaxIncomeList.get(i).getS_NAME()) + ".png\"},");
            }  else if(MaxIncomeList.get(i).getGubun().equals("t1721")) {
               responseS = responseS.concat("{\"category\": \"\",");
               responseS = responseS.concat("\"start\": \"17:00\", \"end\": \"21:00\",");
               responseS = responseS.concat("\"text\": \"????????????" + MaxIncomeList.get(i).getS_NAME().substring(0,2) + " ??????!!\",");
               responseS = responseS.concat("\"textDisabled\": false,");
               responseS = responseS.concat("\"icon\": \"resources/img/markers/" + changeSNameToMarkerName(MaxIncomeList.get(i).getS_NAME()) + ".png\"},");
            }  else if(MaxIncomeList.get(i).getGubun().equals("t2124")) {
               responseS = responseS.concat("{\"category\": \"\",");
               responseS = responseS.concat("\"start\": \"21:00\", \"end\": \"24:00\",");
               responseS = responseS.concat("\"text\": \"????????????" + MaxIncomeList.get(i).getS_NAME().substring(0,2) + " ??????!!\",");
               responseS = responseS.concat("\"textDisabled\": false,");
               responseS = responseS.concat("\"icon\": \"resources/img/markers/" + changeSNameToMarkerName(MaxIncomeList.get(i).getS_NAME()) + ".png\"}");
               responseS = responseS.concat("]");
               System.out.println(responseS);
            }
         }
         return responseS;
      }
   
      public String changeSNameToMarkerName(String Name) {
            
            String MarkerName = "";
            if(Name.equals("???????????????")) {
               MarkerName = "china";
            } else if (Name.equals("???????????????")) {
               MarkerName = "japan";
            } else if (Name.equals("???????????????")) {
               MarkerName = "america";
            }else if (Name.equals("?????????")) {
               MarkerName = "bread";
            }else if (Name.equals("??????????????????")) {
               MarkerName = "one";
            }else if (Name.equals("???????????????")) {
               MarkerName = "korea";
            }else if (Name.equals("???????????????")) {
               MarkerName = "chicken";
            }else if (Name.equals("????????????????????")) {
               MarkerName = "res";
            }else if (Name.equals("??????????????")) {
               MarkerName = "cafe";
            }else if (Name.equals("???????????????")) {
               MarkerName = "bunsik";
            }
            return MarkerName;
         }


}