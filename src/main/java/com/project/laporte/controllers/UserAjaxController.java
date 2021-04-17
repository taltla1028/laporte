package com.project.laporte.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Orderlist;
import com.project.laporte.model.Outuser;
import com.project.laporte.model.Product;
import com.project.laporte.model.Reserve;
import com.project.laporte.model.User;
import com.project.laporte.model.Userscoupon;
import com.project.laporte.model.Wish_prod;
import com.project.laporte.model.Wishlist;
import com.project.laporte.service.OrderlistService;
import com.project.laporte.service.ProductListService;
import com.project.laporte.service.ReserveService;
import com.project.laporte.service.UserService;
import com.project.laporte.service.UserscouponService;
import com.project.laporte.service.WishlistService;


@Controller
public class UserAjaxController {

	/** WebHelper 주입 */
	@Autowired  WebHelper webHelper;
	
	/** RegexHelper 주입 */
	@Autowired  RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	@Autowired  UserService userService;
	@Autowired 	UserscouponService userscouponService;
	@Autowired	ReserveService	reserveService;
	@Autowired 	OrderlistService orderlistService;
	@Autowired  WishlistService wishlistService;
	@Autowired  ProductListService productlistService;
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;

	@RequestMapping(value="/home.out", method=RequestMethod.GET)
    public  ModelAndView home(Model model) {	
        // "/src/main/webapp/WEB-INF/views/home.jsp" 파일을 View로 지정한다.
		
		/** 추천제품 */
		Product input = new Product();
		List<Product> output = new ArrayList<Product>();
		
		try {
			// 데이터 조회
			output = productlistService.getProductlistList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("output", output);
		return new  ModelAndView("/home");
    }
	
	@RequestMapping(value="/home.do", method=RequestMethod.GET)
    public  ModelAndView sessionWrite(Model model, 
    		HttpServletRequest request, HttpServletResponse response,
			@CookieValue(value = "my_wish", defaultValue = "0", required = false) int my_wish) {
		/** 컨트롤러에서 세션을 식별하기 위한 처리 */
		// 세션값은 request 내장 객체를 통해서 HttpSession 객체를 생성해야 접근할 수 있다.
		HttpSession session = request.getSession();
		
		int mySession = (int) session.getAttribute("my_session");
		
		/** 추천제품 */
		Product input = new Product();
		List<Product> output = new ArrayList<Product>();

		// 현재 상품이 위시리스트에 담겨있는지 확인
		Wishlist wishValue = new Wishlist();

// 로그인 여부 확인 -> 로그인 중 일때 - userno!=0 / 로그인 하지 않았을때 - userno ==0
		int userno = 0;
		if (session.getAttribute("my_session") != null) {
			userno = (int) session.getAttribute("my_session");
		}

//쿠키에 저장되어있는 위시리스트가 내 계정의 위시리스트가 맞는지 확인 -> 아니라면 my_wish 지우기
		if (my_wish != 0) {
			Wishlist oldwish = new Wishlist();
			oldwish.setWishno(my_wish);
			Wishlist newwish = new Wishlist();
			try {
				// 데이터 조회
				newwish = wishlistService.getWishListOne(oldwish);
			} catch (Exception e) {
				e.printStackTrace();
			}
			if (newwish.getUserno() != userno) {
				Cookie cookiewish = new Cookie("my_wish", "0");
				cookiewish.setPath("/");
				cookiewish.setDomain("itproject.ezenac.co.kr");
				cookiewish.setMaxAge(0);
				response.addCookie(cookiewish);
				my_wish = 0;
			}
		}

		Wishlist basicoutput = new Wishlist();
		if (my_wish == 0 && userno != 0) { // 로그인은 했으나 쿠키에 위시리스트가 저장되어있지 않을때 기본 위시리스트에 저장
			// 사용자의 기본위시리스트번호 조회
			Wishlist basicinput = new Wishlist();
			basicinput.setUserno(userno);

			try {
				// 데이터 조회
				basicoutput = wishlistService.selectBasicWish(basicinput);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		try {
			// 데이터 조회
			output = productlistService.getProductlistList(input);
		} catch (Exception e) {
			e.printStackTrace();
		}

		wishValue.setWishno(my_wish);
		List<Wish_prod> wishoutput = new ArrayList<Wish_prod>();
		try {
			wishoutput = wishlistService.getWishitemList(wishValue);
		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("userno", userno);
		model.addAttribute("output", output);
		model.addAttribute("basicoutput", basicoutput);
		model.addAttribute("my_wish", my_wish);
		model.addAttribute("wishoutput", wishoutput);


			//추출한 값을 View에게 전달
		model.addAttribute("my_session", mySession);
		
        // "/src/main/webapp/WEB-INF/views/home.jsp" 파일을 View로 지정한다.
		return new  ModelAndView("/home");
    }
	
	@RequestMapping(value="/02_mypage/join.do", method=RequestMethod.GET)
    public ModelAndView join() {
        // "/src/main/webapp/WEB-INF/views/02_mypage/join.jsp" 파일을 View로 지정한다.
        return new ModelAndView("/02_mypage/join");
    }
	
	@RequestMapping(value="/02_mypage/join2.do", method=RequestMethod.GET)
	public ModelAndView join2(Model model) {
		// "/src/main/webapp/WEB-INF/views/02_mypage/join2.jsp" 파일을 View로 지정한다.
		return new ModelAndView("/02_mypage/join2");
	}
	
	@RequestMapping(value="/02_mypage/login.do", method=RequestMethod.GET)
    public String login() {
        // "/src/main/webapp/WEB-INF/views/02_mypage/login.jsp" 파일을 View로 지정한다.
        return "/02_mypage/login";
    }
	
	@RequestMapping(value="/02_mypage/pwfind.do", method=RequestMethod.GET)
	public ModelAndView loginPwFind(){
		// "/src/main/webapp/WEB-INF/views/02_mypage/login_pwfind.jsp" 파일을 View로 지정한다.
		
		return new ModelAndView("/02_mypage/pwfind");
	}
	
	@RequestMapping(value="/02_mypage/pwrevise.do", method=RequestMethod.GET)
	public ModelAndView loginPwRevise(Model model,
			//GET,POST파라미터 받기
			@RequestParam(value="userno", defaultValue="0") int userno) {
		
		User input = new User();
		input.setUserno(userno);
		
		//파라미터값을 View에게 전달한다.
		model.addAttribute("output", input);
		// "/src/main/webapp/WEB-INF/views/02_mypage/login_pwrevise.jsp" 파일을 View로 지정한다.
		return new ModelAndView("/02_mypage/pwrevise");
	}
	
	@RequestMapping(value="/02_mypage/mypage.do", method=RequestMethod.GET)
    public ModelAndView mypage(Model model, HttpServletResponse response,
    		@RequestParam(value="userno") int userno) {
        // "/src/main/webapp/WEB-INF/views/02_mypage/mypage.jsp" 파일을 View로 지정한다.
		
		/** 1) 회원정보 */
		//회원정보 조회를 위한 객체 생성
		User input = new User();
		input.setUserno(userno);
		
		//회원정보 출력을 위한 객체 초기화
		User output = null;
		
		/** 2) 주문내역 */
		//주문정보 조회를 위한 객체 생성
		Orderlist o_input = new Orderlist();
		o_input.setUserno(userno);
		
		//주문정보 갯수 출력을 위한 객체 초기화
		int o_output = 0;
		
		/** 3) 위시리스트 내역 */
		//위시리스트 갯수 조회를 위한 객체 생성
		Wishlist w_input = new Wishlist();
		w_input.setUserno(userno);
		
		//위시리스트 갯수 출력을 위한 객체 초기화
		int w_output = 0;
		
		/** 4) 예약정보 */
		//예약정보 조회를 위한 객체 생성
		Reserve r_input = new Reserve();
		r_input.setUserno(userno);
		
		//예약정보 출력을 위한 객체 초기화
		int r_output = 0;
		
		//회원이 보유한 쿠폰 조회를 위한 객체 생성
		Userscoupon uc_input = new Userscoupon();
		uc_input.setUserno(userno);
		
		//회원이 보유한 쿠폰을 출력하기 위한 객체 초기화
		List<Userscoupon> uc_output = null;
		
		
		try {
			output = userService.getUserItem(input);
			
			o_output = orderlistService.getOrderQty(o_input);
			
			w_output = wishlistService.getWishlistQTY(w_input);
			
			r_output = reserveService.checkReserve(r_input);
			
			uc_output = userscouponService.getUsersCouponList(uc_input);
			
		}catch(Exception e) {e.printStackTrace();}
		
		//View 처리
		 model.addAttribute("output", output);
		 model.addAttribute("o_output", o_output);
		 model.addAttribute("w_output", w_output);
		 model.addAttribute("r_output", r_output);
		 model.addAttribute("uc_output", uc_output);
        return new ModelAndView("/02_mypage/mypage");
    }
	 
		@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	    public ModelAndView logout(Model model,
	    		HttpServletResponse response, HttpServletRequest request,
	    		@CookieValue(value = "my_wish", defaultValue = "0", required = false) int my_wish) {
			
			if(my_wish!=0) {
			     Cookie[] cookies = request.getCookies();    //쿠키를 서버에서 요청한다.
			     for(int i=0;i<cookies.length;i++)
			     {
			          if(cookies[i].getName().equals("my_wish"))    //MyCookie1이름의 쿠키가 현재 있으면
			          {
			        	  Cookie cookie = new Cookie("my_wish", "test");  //쿠키를 생성해주고
				          cookie.setMaxAge(0);    //쿠키의 최대기간을 "0"으로 지정해주면 제거 된다.
				          response.addCookie(cookie);   //서버에 추가를 요청한다.(저장은 클라이언트에)
			          }
			     }
			}
			

	        // "/src/main/webapp/WEB-INF/views/02_mypage/join2.jsp" 파일을 View로 지정한다.
	        return new ModelAndView("/logout");
	    }
		
		/** 회원 관리(관리자 */
		 @RequestMapping(value="/11_admin/admin_userlist.do", method=RequestMethod.GET)
		    public ModelAndView adminUserlist(Model model, HttpServletRequest request,
		    		@RequestParam(value="userno", defaultValue="0") int userno) {
			 
			 /** 로그인 여부 검사 */
				String adminno = "";
				HttpSession session = request.getSession();
		    	if(session.getAttribute("my_admin")!=null) {
		    		adminno = (String) session.getAttribute("my_admin");
		    	}
		    	if(adminno == "") {
		    		return webHelper.redirect(null, "관리자로 로그인을 해주세요.");
		    	}
		    	
			 //회원 목록 조회
			 List<User> output = null;
			 
			 //회원별 정보 조회
			 User u_input = new User();
			 User u_output = null;
			 
			 //회원별 주문정보 조회
			 Orderlist o_input = new Orderlist();
			 
			 //주문정보 조회
			 List<Orderlist> o_output = null;
			 
			//회원이 보유한 쿠폰 조회를 위한 객체 생성
				Userscoupon uc_input = new Userscoupon();
				
			//회원이 보유한 쿠폰을 출력하기 위한 객체 초기화
			List<Userscoupon> uc_output = null;
			 
			
			//탈퇴 회원 목록 조회
			List<Outuser> ou_output = null;
			 
			 try {
				 
				 if(userno != 0) {
				 o_input.setUserno(userno);
				 o_output = orderlistService.getOrderListbyUserno(o_input);
				
				 u_input.setUserno(userno);
				 u_output = userService.getUserItem(u_input);
				 
				 uc_input.setUserno(userno);
				 uc_output = userscouponService.getUsersCouponList(uc_input);
				 
				 if(o_output != null) {
					 model.addAttribute("o_output", o_output);
					 }
				 
				 if(u_output != null) {
					 model.addAttribute("u_output", u_output);
					 
				 }
				 
				 if(uc_output != null) {
					model.addAttribute("uc_output", uc_output);
					
					 
				 }
				 
				 output = userService.getUserlist(null);
				 ou_output = userService.getOutuserList(null);
			 }
				 output = userService.getUserlist(null);
				 ou_output = userService.getOutuserList(null);
			 
				 	 
			 }catch(Exception e) {e.printStackTrace();}
			 
			 //View 처리
			 
			 model.addAttribute("output", output);
			 model.addAttribute("ou_output", ou_output);
			 
			 
		        // "/src/main/webapp/WEB-INF/views/11_admin/admin_userlist.jsp" 파일을 View로 지정한다.
		        return new ModelAndView("/11_admin/admin_userlist");
		    }
}
