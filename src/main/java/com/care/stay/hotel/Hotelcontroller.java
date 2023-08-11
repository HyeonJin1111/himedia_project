
package com.care.stay.hotel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
public class Hotelcontroller {
	@Autowired private HotelService service;
	@Autowired private HttpSession session;

	// 아무것도 지정하지 않았을때 
	//	@RequestMapping("hotellist")
	//	public String hotellist() {
	//				
	//		return "hotel/hotellist";
	//	}

	
	  //hotellist 첫화면 
	  @RequestMapping("hotellist") 
	  	public String hotellist(
	  
	  @RequestParam(value="currentPage", required = false)String cp, Model model) {
	  
	  System.out.println("hotellist나오는지 알려주세요");
	  
	  service.hotellist(cp,model); 
	  	return "hotel/hotellist"; 
	  	}
	  
	  
	  //hotellist 지역선택 
	  @RequestMapping("Main") 
	  	public String Main(
			  
			  @RequestParam(value="currentPage", required = false)  String cp, 
	  		  @RequestParam(value="hdetailregion" , required = false) String selectedText, Model model)
	  {
		  		
		  		System.out.println("currentPage:" + cp);
		  		System.out.println("selectedText: " + selectedText);
			  
		  		service.Main(selectedText, cp ,model); 
			  	
		  		return "hotel/hotellist";
			  	}
	
	  
	@RequestMapping("hotelpage")
	public String hotelpage() {
		return "hotel/hotelpage";
	}
	
	

}
