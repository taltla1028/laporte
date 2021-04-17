package com.project.laporte.controllers;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Cart;
import com.project.laporte.model.Order_prod;
import com.project.laporte.model.Orderlist;
import com.project.laporte.model.User;
import com.project.laporte.model.Userscoupon;
import com.project.laporte.service.CartService;
import com.project.laporte.service.CouponService;
import com.project.laporte.service.OrderProdService;
import com.project.laporte.service.OrderlistService;
import com.project.laporte.service.UserService;
import com.project.laporte.service.UserscouponService;

@RestController
public class OrderlistRestController {
	
	 /** WebHelper 주입 */
    @Autowired  WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired  RegexHelper regexHelper;
    
    /** Service 패턴 구현체 주입 */
    @Autowired  CouponService couponService;
    @Autowired 	OrderlistService orderlistService;
    @Autowired 	CartService cartService;
    @Autowired 	UserscouponService userscouponService;
    @Autowired  UserService userService;
    @Autowired 	OrderProdService orderprodService;

    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    @Value("#{servletContext.contextPath}")
    String contextPath;
    
    /** 새로운 구매 생성 */
    @RequestMapping(value="/07_purchase", method=RequestMethod.POST)
    public Map<String, Object>add_coupon(Model model, HttpServletRequest request,
    		@RequestParam(value="addr1", defaultValue="") String addr1,
    		@RequestParam(value="addr2", defaultValue="") String addr2,
    		@RequestParam(value="postcode", defaultValue="") String postcode,
    		@RequestParam(value="name", defaultValue="") String name,
    		@RequestParam(value="email", defaultValue="") String email,
    		@RequestParam(value="phoneno", defaultValue="") String phoneno,
    		@RequestParam(value="loctype", defaultValue="") String loctype,
    		@RequestParam(value="servicetype", defaultValue="") String servicetype,
    		@RequestParam(value="request", defaultValue="NULL") String p_request,
    		@RequestParam(value="sizelimit", defaultValue="") String sizelimit,
    		@RequestParam(value="deldate", defaultValue="") String deldate,
    		@RequestParam(value="paytype", defaultValue="") String paytype,
    		@RequestParam(value="totalprice", defaultValue="0") int totalprice,
    		@RequestParam(value="usrcouponno", defaultValue="0") int usrcouponno,
    		@RequestParam(value="point", defaultValue="0") int point,
    		@RequestParam(value="userno", defaultValue="0") int userno,
    		@RequestParam(value="deltypeno", defaultValue="0") int deltypeno
    		){
    	
    	/**1) 사용자가 입력한 파라미터 유효성 검사*/
		//유효성 검사 프론트에서 구현
    	
		/** 2) 데이터 저장하기 */
		//저장할 값들을 Beans에 담는다.
		Orderlist input = new Orderlist();
		input.setAddr1(addr1);
		input.setAddr2(addr2);
		input.setPostcode(postcode);
		input.setName(name);
		input.setEmail(email);
		input.setPhoneno(phoneno);
		input.setLoctype(loctype);
		input.setServicetype(servicetype);
		input.setRequest(p_request);
		input.setSizelimit(sizelimit);
		input.setDeldate(deldate);
		input.setPaytype(paytype);
		input.setTotalprice(totalprice);
		input.setPoint(point);
		input.setUserno(userno);
		input.setDeltypeno(deltypeno);
		input.setUsrcouponno(usrcouponno);			
		
		
		//저장된 결과를 조회하기 위한 객체
		Orderlist output = null;
		
		/** 3) 사용한 쿠폰 업데이트 */
		Userscoupon uc_input = new Userscoupon();
		Userscoupon uc_output =null;
		
		
		/** 4) 구매 내역에 저장하기 */
		Order_prod op_input = new Order_prod();
		Order_prod op_output = null;
	
				
		/** 5) 구매한 장바구니 삭제하기 */

				// 카트 정보를 불러올 객체 생성
		
				//체크된 카트 배열을 불러온다.
				String[] selectedCart = request.getParameterValues("cartno[]");
				// 체크된 카트 번호 변수 선언 및 초기화
				int selectedCartno = 0;
				
				Cart c_input = new Cart();
				Cart c_output = null;
				
				
				// 조회한 카트 정보를 담을 객체 초기화
				int c_delete = 0;
				
				
		try {
			//데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 PK값이 저장된다.
			orderlistService.addPurchase(input);
			
			//데이터 조회
			output = orderlistService.getPurchase(input);
		
			
			if(output != null) {
				try {
					if(output.getUsrcouponno() != 0) 
					{
					
					uc_input.setUsrcouponno(output.getUsrcouponno());
					uc_input.setUsestatus("Y");
				
					userscouponService.updateUsersCoupon(uc_input);
					uc_output = userscouponService.getUsersCoupon(uc_input);
					
					System.out.println(uc_output);
					
					}
						
				
					// 사용한 포인트 계산하기
					
					/** 5) 사용한 포인트 차감하기 */
					
					//현재 사용자가 보유하고 있는 포인트 조회
					User have_point = new User();
					have_point.setUserno(userno);
					User u_output = null;
					
					u_output = userService.getUserItem(have_point);
					
					//사용한 포인트 조회
					User change_point = new User();
					int use_point = 0;
					
					use_point = output.getPoint();
					
					// 보유 포인트 - 사용한 포인트
					int now_point = u_output.getPoint() - use_point;
					System.out.println(now_point);
					
					change_point.setUserno(output.getUserno());
					change_point.setPoint(now_point);
				
					System.out.print(change_point);
					
					// 사용한 포인트 차감하기
					userService.pointRevise(change_point);
					u_output = userService.getUserItem(change_point);
					
					System.out.println(u_output);
					
				
				
				//구매한 장바구니 삭제하기
					for(var i = 0;  i < selectedCart.length; i++) {
						
						// 체크된 카트 번호 int로 parse
						selectedCartno = Integer.parseInt(selectedCart[i]);
						
						c_input.setCartno(selectedCartno);
						c_output = cartService.getCartByCartno(c_input);
						

					// 구매내역 저장하기
					op_input.setOrderno(output.getOrderno());
					op_input.setProdno(c_output.getProdno());
					op_input.setEa(c_output.getEa());
					
					orderprodService.addOrderProd(op_input);
					
					// 저장된 구매내역 조회
					op_output = orderprodService.getOrderProd(op_input);
					
					System.out.println(op_output);
					
					//구매 내역 저장 완료 후 해당 카트는 삭제
					c_delete = cartService.deleteCart(c_output);
			
					
					
				}
				}catch(Exception e) {
					return webHelper.getJsonError(e.getLocalizedMessage());
				
			}
			}
			
		}catch(Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 결과를 확인하기 위한 페이지 연동 */
		//저장 결과를 확인하기 위해 데이터 저장 시 생성된 PK값을 상세 페이지로 전달해야 한다.
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", c_delete);
		return webHelper.getJsonData();
    }

}
