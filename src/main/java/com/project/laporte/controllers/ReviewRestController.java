package com.project.laporte.controllers;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.RevComment;
import com.project.laporte.model.Review;
import com.project.laporte.service.ReviewService;

@RestController
public class ReviewRestController {
	/** WebHelper 주입 */
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	ReviewService reviewService;

	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/**리뷰 등록 페이지 */
	@RequestMapping(value = "/04_review/review", method = RequestMethod.POST)
	public Map<String, Object> addReview(@RequestParam(value = "prodno", defaultValue = "0") int prodno,
			@RequestParam(value = "userno", defaultValue = "0") int userno,
			@RequestParam(value = "orderno", defaultValue = "0") int orderno,
			@RequestParam(value = "title", defaultValue = "") String title,
			@RequestParam(value = "content", defaultValue = "") String content,
			@RequestParam(value = "easyscore", defaultValue = "0") int easyscore,
			@RequestParam(value = "benefitscore", defaultValue = "0") int benefitscore,
			@RequestParam(value = "qualityscore", defaultValue = "0") int qualityscore,
			@RequestParam(value = "funcscore", defaultValue = "0") int funcscore,
			@RequestParam(value = "appearscore", defaultValue = "0") int appearscore,
			@RequestParam(value = "avgscore", defaultValue = "0") int avgscore,
			@RequestParam(value = "recommend", defaultValue = "") String recommend) {
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (title == "") {
			return webHelper.getJsonWarning("리뷰 제목을 입력해주세요.");
		}
		if (content == "") {
			return webHelper.getJsonWarning("리뷰 내용을 입력해주세요.");
		}
		
		/** 2) 데이터 저장하기 */
		Review input = new Review();
		input.setProdno(prodno);
		input.setUserno(userno);
		input.setOrderno(orderno);
		input.setTitle(title);
		input.setContent(content);
		input.setEasyscore(easyscore);
		input.setBenefitscore(benefitscore);
		input.setQualityscore(qualityscore);
		input.setFuncscore(funcscore);
		input.setAppearscore(appearscore);
		input.setAvgscore(avgscore);
		input.setRecommend(recommend);
		
		Review output=null;
		
		try {
			// 데이터 저장
			reviewService.addReview(input);

			// 데이터 조회
			output = reviewService.getReviewItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);
		return webHelper.getJsonData(data);
	
	}
	
	/** 리뷰내용 수정 */
	@RequestMapping(value = "/04_review/review", method = RequestMethod.PUT)
	public Map<String, Object> editReview(@RequestParam(value = "reviewno", defaultValue = "0") int reviewno,
			@RequestParam(value = "title", defaultValue = "") String title,
			@RequestParam(value = "content", defaultValue = "") String content,
			@RequestParam(value = "easyscore", defaultValue = "0") int easyscore,
			@RequestParam(value = "benefitscore", defaultValue = "0") int benefitscore,
			@RequestParam(value = "qualityscore", defaultValue = "0") int qualityscore,
			@RequestParam(value = "funcscore", defaultValue = "0") int funcscore,
			@RequestParam(value = "appearscore", defaultValue = "0") int appearscore,
			@RequestParam(value = "avgscore", defaultValue = "0") int avgscore,
			@RequestParam(value = "recommend", defaultValue = "") String recommend) {

		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (title == "") {
			return webHelper.getJsonWarning("리뷰 제목을 입력해주세요.");
		}
		if (content == "") {
			return webHelper.getJsonWarning("리뷰 내용을 입력해주세요.");
		}
		
		/** 2) 데이터 저장하기 */
		Review input = new Review();
		input.setReviewno(reviewno);
		input.setTitle(title);
		input.setContent(content);
		input.setEasyscore(easyscore);
		input.setBenefitscore(benefitscore);
		input.setQualityscore(qualityscore);
		input.setFuncscore(funcscore);
		input.setAppearscore(appearscore);
		input.setAvgscore(avgscore);
		input.setRecommend(recommend);

		// 수정된 결과를 조회하기 위한 객체
		Review output = null;

		try {
			// 데이터 수정
			reviewService.editReview(input);
			// 수정 결과 조회
			output = reviewService.getReviewItem(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("item", output);
		return webHelper.getJsonData(map);
	}
	
	/** 리뷰를 삭제하는 페이지 */
	@RequestMapping(value = "/04_review/review", method = RequestMethod.DELETE)
	public Map<String, Object> deleteReview(@RequestParam(value = "reviewno") int reviewno) {
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (reviewno == 0) {
			return webHelper.getJsonWarning("리뷰 번호가 없습니다.");
		}

		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건 값을 Beans에 저장하기
		Review input = new Review();
		input.setReviewno(reviewno);
		
		try {
			reviewService.deleteReview(input); //리뷰삭제
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		// 확인할 대상이 삭제된 결과값만 OK로 전달
		return webHelper.getJsonData();
	}
	
	/**리뷰 답변 등록 페이지 */
	@RequestMapping(value = "/11_admin/admin_review_answer", method = RequestMethod.POST)
	public Map<String, Object> addReviewAdmin(
			@RequestParam(value = "content", defaultValue = "") String content,
			@RequestParam(value = "reviewno", defaultValue = "0") int reviewno) {
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (content == "") {
			return webHelper.getJsonWarning("리뷰 답변을 입력해주세요.");
		}
		if (reviewno == 0) {
			return webHelper.getJsonWarning("리뷰 번호 없습니다.");
		}
		
		/** 2) 데이터 저장하기 */
		RevComment input = new RevComment();
		input.setContent(content);
		input.setReviewno(reviewno);
		
		RevComment output=null;
		
		try {
			// 데이터 저장
			reviewService.addRevComment(input);

			// 데이터 조회
			output = reviewService.admintRevcommentList(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("item", output);
		return webHelper.getJsonData(data);
	
	}
	
	/**리뷰 답변 등록 페이지 */
	@RequestMapping(value = "/11_admin/admin_review_answer", method = RequestMethod.PUT)
	public Map<String, Object> editReviewAdmin(
			@RequestParam(value = "content", defaultValue = "") String content,
			@RequestParam(value = "revcomno", defaultValue = "0") int revcomno) {
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (content == "") {
			return webHelper.getJsonWarning("리뷰 답변을 입력해주세요.");
		}
		if (revcomno == 0) {
			return webHelper.getJsonWarning("답변리뷰 번호 없습니다.");
		}
		
		/** 2) 데이터 저장하기 */
		RevComment input = new RevComment();
		input.setContent(content);
		input.setRevcomno(revcomno);
		
		
		try {
			reviewService.editRevComment(input);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) JSON 출력하기 */
		return webHelper.getJsonData();
	
	}
	
	/** 리뷰답변을 삭제하는 페이지 */
	@RequestMapping(value = "/11_admin/admin_review_answer", method = RequestMethod.DELETE)
	public Map<String, Object> deleteReviewadmin(@RequestParam(value = "reviewno") int reviewno) {
		/** 1) 파라미터 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 삭제가 불가능하므로 반드시 필수값으로 처리해야 한다.
		if (reviewno == 0) {
			return webHelper.getJsonWarning("리뷰 번호가 없습니다.");
		}

		/** 2) 데이터 삭제하기 */
		// 데이터 삭제에 필요한 조건 값을 Beans에 저장하기
		RevComment input = new RevComment();
		input.setReviewno(reviewno);

		try {
			reviewService.deleteRevComment(input); //리뷰 답변 삭제
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기 위한 JSON 출력 */
		// 확인할 대상이 삭제된 결과값만 OK로 전달
		return webHelper.getJsonData();
	}

}
