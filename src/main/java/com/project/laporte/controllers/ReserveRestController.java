package com.project.laporte.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Reserve;
import com.project.laporte.service.ReserveService;


@RestController
public class ReserveRestController {
	/** WebHelper 주입 */
	// --> import org.springframework.beans.factory.annotation.Autowired;
	// --> import com.project.laporte.helper.WebHelper;
	@Autowired WebHelper webHelper;
	
	/** RegexHelper 주입 */
	// --> import com.project.laporte.helper.RegexHelper;
	@Autowired RegexHelper regexHelper;
	
	/** Service 패턴 구현체 주입 */
	// --> import com.project.laporte.service.ReserveService;
	@Autowired ReserveService reserveService;
	
	/** 상세 페이지 */
	@RequestMapping(value ="/08reserve/{reserveno}", method = RequestMethod.GET)
	public Map<String, Object> get_item(@PathVariable("reserveno") int reserveno){
		
		/** 1) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		Reserve input = new Reserve();
		input.setReserveno(reserveno);
		
		// 조회결과를 저장할 객체 선언
		Reserve output = null;
		
		try {
			output = reserveService.getReserveItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 2) JSON 출력하기 */
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("item",output);
		
		return webHelper.getJsonData(data);
	}
	
	
	
	
	// 관리자 목록 
	@RequestMapping(value="/11_admin",method = RequestMethod.GET)
	public Map<String,Object>get_admin_list(){
		
		List<Reserve> output = null;
		
		try {
			output = reserveService.getReserveList(null);
		}catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3)JSON 출력하기 */
		Map<String,Object>data = new HashMap<String, Object>();
		data.put("list", output);
		
		return webHelper.getJsonData(data);
	}
	
 
	/** 목록 페이지 */
	
	@RequestMapping(value = "/08_reserve/{userno}", method = RequestMethod.GET)
	public Map<String,Object>get_list(
			@PathVariable("userno")int userno){
		
		Reserve input = new Reserve();
		input.setUserno(userno);
		
		List<Reserve> output = null;
		
		try {
			output = reserveService.getReservesList(input);
		}catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3) JSON 출력하기 */
		Map<String,Object> data = new HashMap<String, Object>();
		data.put("list", output);
		
		return webHelper.getJsonData(data);
	}
	
	/** 작성 폼에 대한 action 페이지 */
	@RequestMapping(value = "/08_reserve", method = RequestMethod.POST)
	public Map<String,Object>post(HttpServletRequest requestsession,
			@RequestParam(value = "showroom", defaultValue="")String showroom,
			@RequestParam(value = "date", defaultValue = "")String date,
			@RequestParam(value = "name",defaultValue = "")String name,
			@RequestParam(value = "email", defaultValue = "")String email,
			@RequestParam(value = "phoneno",defaultValue = "")String phoneno,
			@RequestParam(value = "time",defaultValue="")String time,
			@RequestParam(value="area",defaultValue="")String area,
			@RequestParam(value="request",defaultValue="")String request,
			@RequestParam(value="userno",defaultValue="0")int userno
			
			){
		// 일반 문자열 입력 컬럼 --> String으로 파라미터가 선언되어 있는 경우 값이 입력되지 않으면 빈 문자열로 처리된다.
				if(!regexHelper.isValue(showroom))	{return webHelper.getJsonWarning(" 매장 을 선택 해주세요.");}
				if(!regexHelper.isValue(date)) {return webHelper.getJsonWarning("날짜 선택을 해주세요.");}
				if(!regexHelper.isValue(name))	{return webHelper.getJsonWarning("이름을 입력해주세요");}
				if(!regexHelper.isKor(name)) {return webHelper.getJsonWarning("이름은 한글만 가능합니다.");}
				if(!regexHelper.isValue(email))	{return webHelper.getJsonWarning("이메일을 입력해주세요.");}
				if(!regexHelper.isEmail(email))	{return webHelper.getJsonWarning("이메일 형식으로 입력해주세요.");}
				if(!regexHelper.isValue(phoneno))	{return webHelper.getJsonWarning("휴대폰 번호를 입력해주세요.");}
				if(!regexHelper.isCellPhone(phoneno)) {return webHelper.getJsonWarning("휴대폰 번호 형식으로 입력해주세요.");}
				if(!regexHelper.isValue(time)) {return webHelper.getJsonWarning("예약 시간을 선택해주세요.");}
				if(!regexHelper.isValue(area))	{return webHelper.getJsonWarning("컨설팅 영역을 선택해주세요.");}
				
				HttpSession session = requestsession.getSession();
				userno = (int) session.getAttribute("my_session");
				/** 2) 데이터 저장하기 */
				Reserve input = new Reserve();
				
				input.setShowroom(showroom);
				input.setDate(date);
				input.setName(name);
				input.setEmail(email);
				input.setPhoneno(phoneno);
				input.setTime(time);
				input.setArea(area);
				input.setRequest(request);
				input.setUserno(userno);
				
				// 저장된 결과를 조회하기 위한 객체
				Reserve output = null;
				try {
					// 데이터 저장
					// --> 데이터 저장에 성공하면 파라미터로 전달하는 input 객체에 pk값이 저장된다.
					reserveService.addReserve(input);
					
					//데이터 조회
					output = reserveService.getReserveItem(input);
				} catch (Exception e) {
					return webHelper.getJsonError(e.getLocalizedMessage());
				} 
				
				/** 3) 결과를 확인하기 위한 Json 출력 */
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("item",output);
				return webHelper.getJsonData(map);
	}
	
	/** 수정폼에 대한 action 페이지 */
	@RequestMapping(value = "/08_reserve", method = RequestMethod.PUT)
	public Map<String,Object>reserve_edit(
			@RequestParam(value="reserveno",defaultValue="0") int reserveno,
			@RequestParam(value="date",defaultValue = "")String date,
			@RequestParam(value="showroom",defaultValue="")String showroom,
			@RequestParam(value="time",defaultValue="")String time,
			@RequestParam(value="area",defaultValue="")String area,
			@RequestParam(value="request",defaultValue="")String request){
		/** 1)사용자가 입력한 파라미터 유효성 검사 */
		if(!regexHelper.isValue(date))	{return webHelper.getJsonWarning("날짜가 입력되지 않았습니다.");}
		if(!regexHelper.isValue(showroom))	{return webHelper.getJsonWarning("매장을 선택해주세요.");}
		if(!regexHelper.isValue(time))	{return webHelper.getJsonWarning("시간을 선택해주세요.");}
		if(!regexHelper.isValue(area))	{return webHelper.getJsonWarning("컨설팅 영역을 선택해주세요.");}
		
		/** 2)데이터 수정하기*/
		// 수정할 값들을 Beans에 담는다.
		Reserve input = new Reserve();
		input.setReserveno(reserveno);
		input.setDate(date);
		input.setShowroom(showroom);
		input.setTime(time);
		input.setArea(area);
		input.setRequest(request);
		
		//수정된 결과를 조회하기 위한 객체
		Reserve output = null;
		
		try {
			//데이터 수정
			reserveService.editReserve(input);
			// 수정 결과 조회
			output = reserveService.getReserveItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		/** 3)결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
				map.put("item", output);
		return webHelper.getJsonData(map);
	}
	
	
	/** 예약승인 action 페이지 */
	@RequestMapping(value = "/11_admin_reserve_OK" ,method = RequestMethod.PUT)
	public Map<String,Object>reserve_ok(
			@RequestParam(value="reserveno",defaultValue = "0")int reserveno){
		
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지않는다면 데이터 수정이 불가능함.
		if(reserveno == 0) {
			return webHelper.getJsonWarning("예약번호가 없습니다.");
			
		}
		/** 2)데이터 수정하기 */
		// 데이터 수정에 필요한 조건값을 Beans에 저장하기.
		Reserve input = new Reserve();
		input.setReserveno(reserveno);
		
		List<Reserve>output = null;
		
		try {
			reserveService.updateReservey(input); //데이터 수정하기
			output = reserveService.getReserveList(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3)결과를 확인하기 위한 Json 출력 */
		// 확인할 대상이 수정된 결과값만 Ok로 출력
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);
	}
	
	
	
	/** 예약 취소 Action 페이지 */
	@RequestMapping(value ="/08_reserve_ok", method = RequestMethod.PUT)
	public Map<String,Object>reserve_del(
			 @RequestParam(value="reserveno",defaultValue = "0") int reserveno){
		
		
		/** 2)데이터 수정하기 */
		// 데이터 수정에 필요한 조건값을 Beans에 저장하기.
		Reserve input = new Reserve();
		input.setReserveno(reserveno);
		
		Reserve output = null;
		try {
			// 데이터 수정하기 
			reserveService.deleteReserve(input);
			output=reserveService.getReserveItem(input);
			
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		/** 3)결과를 확인하기 위한 Json 출력 */
		// 확인할 대상이 수정된 결과값만 Ok로 출력
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item",output);
		return webHelper.getJsonData(map);
	}
			
			

		
}
