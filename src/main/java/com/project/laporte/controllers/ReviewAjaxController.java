package com.project.laporte.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.laporte.helper.PageData;
import com.project.laporte.helper.RegexHelper;
import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Prod_category1;
import com.project.laporte.model.Prod_category2;
import com.project.laporte.model.RevComment;
import com.project.laporte.model.Review;
import com.project.laporte.service.ProductService;
import com.project.laporte.service.ReviewService;

@Controller
public class ReviewAjaxController {
	/** WebHelper 주입 */
	// --> import org.springframework.beans.factory.annotation.Autowired;
	// --> import study.spring.springhelper.helper.WebHelper;
	@Autowired
	WebHelper webHelper;

	/** RegexHelper 주입 */
	// --> import study.spring.helper.RegexHelper;
	@Autowired
	RegexHelper regexHelper;

	/** Service 패턴 구현체 주입 */
	@Autowired
	ReviewService reviewService;

	@Autowired
	ProductService productService;

	/** "/프로젝트이름"에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/** 리뷰 목록 페이지 */
	@RequestMapping(value = "/11_admin/admin_review.do", method = RequestMethod.GET)
	public ModelAndView adminReview(Model model, @RequestParam(value = "page", defaultValue = "1") int nowPage,
			@RequestParam(value = "keyword", defaultValue = "", required = false) String keyword,
			@RequestParam(value = "catno1", required = false, defaultValue = "0") int catno1,
			@RequestParam(value = "search_catno2", required = false, defaultValue = "0") int search_catno2,
			@RequestParam(value = "search_condition", defaultValue = "", required = false) String search_condition,
			@RequestParam(value = "search_input", defaultValue = "", required = false) String search_input,
			@RequestParam(value = "search_answer", defaultValue = "", required = false) String search_answer, HttpServletRequest request) {
		/** 로그인 여부 검사 */
		String adminno = "";
		HttpSession session = request.getSession();
		if (session.getAttribute("my_admin") != null) {
			adminno = (String) session.getAttribute("my_admin");
		}
		if (adminno == "") {
			return webHelper.redirect(null, "관리자로 로그인을 해주세요.");
		}

		/** 1) 리뷰에 대한 정보 리스트 */
		List<Review> list = new ArrayList<Review>();

		/** 페이지 구현에 필요한 변수값 생성 */
		int totalCount = 0; // 전체 게시글 수
		int listCount = 10; // 한 페이지당 표시할 목록 수
		int pageCount = 5; // 한 그룹당 표시할 페이지 번호 수

		PageData pageData = null;

		// 검색 조건이 있을 경우
		Review input = new Review();

		// 카테고리 선택시
		if (search_catno2 != 0) {
			input.setCatno2(search_catno2);
		}
		
		if(search_input != "" ) {
			if(search_condition != "") {
				if(search_condition.equals("review_writer")) {
					input.setName(search_input);
				}else if(search_condition.equals("product_num")) {
					if(regexHelper.isNum(search_input)) {
						input.setProdno(Integer.parseInt(search_input));
					}else {
						input.setProdno(0);
					}
				}else if(search_condition.equals("review_title")) {
					input.setTitle(search_input);
				}
			}
		}

		try {
			// 데이터 조회
			totalCount = reviewService.getProductCountAdmin(input);
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			Review.setOffset(pageData.getOffset());
			Review.setListCount(pageData.getListCount());
			list = reviewService.admintReviewList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 2) 리뷰에 대한 답변에 대한 정보 리스트 */
		List<RevComment> revcomment = new ArrayList<RevComment>();
		if (list.size() != 0) {
			for (int i = 0; i < list.size(); i++) {
				Review item = list.get(i);

				RevComment revcomoutput = new RevComment();
				revcomoutput.setReviewno(item.getReviewno());

				RevComment revcomitem = new RevComment();
				try {
					// 데이터 조회
					revcomitem = reviewService.admintRevcommentList(revcomoutput);
					if (revcomitem != null) {
						revcomment.add(revcomitem);
					}

				} catch (Exception e) {
					return webHelper.redirect(null, e.getLocalizedMessage());
				}
			}
		}

		/** 데이터 조회하기 **/
		// 카테고리 대분류 목록 조회 결과를 저장할 객체 선언
		List<Prod_category1> category1 = null;

		// 카테고리 소분류 목록 조회 결과를 저장할 객체 선언
		// catno1을 Prod_category2 Beans에 넣어서 2차 카테고리 추출
		Prod_category2 cat2 = new Prod_category2();
		cat2.setCatno1(catno1);
		List<Prod_category2> category2 = null;

		try {
			// 데이터 조회 --> 검색조건 없이 모든 카테고리 조회
			category1 = productService.category(null);
			// 2차 카테고리 -> catno1을 넣은 Beans를 파라미터로 넣고 카테고리 데이터 조회
			category2 = productService.category2(cat2);
			// 데이터 조회 -> 검색조건 없이 모든 상품 조회
			// output = productService.getProductList(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** View 처리하기 */
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("item", list);
		model.addAttribute("revcom", revcomment);
		model.addAttribute("pageData", pageData);
		model.addAttribute("category1", category1);
		model.addAttribute("category2", category2);
		model.addAttribute("catno1", catno1);
		model.addAttribute("search_catno2", search_catno2);
		model.addAttribute("search_condition", search_condition);
		return new ModelAndView("11_admin/admin_review");
	}

	/** 리뷰 답변 남기기 페이지 */
	@RequestMapping(value = "/11_admin/admin_review_answer.do", method = RequestMethod.GET)
	public ModelAndView adminReviewComment(Model model,
			@RequestParam(value = "reviewno", defaultValue = "0") int reviewno, HttpServletRequest request) {
		/** 로그인 여부 검사 */
		String adminno = "";
		HttpSession session = request.getSession();
		if (session.getAttribute("my_admin") != null) {
			adminno = (String) session.getAttribute("my_admin");
		}
		if (adminno == "") {
			return webHelper.redirect(null, "관리자로 로그인을 해주세요.");
		}

		if (reviewno == 0) {
			return webHelper.redirect(null, "리뷰 번호가 없습니다");
		}
		Review input = new Review();
		input.setReviewno(reviewno);

		Review output = new Review();

		try {
			// 데이터 조회
			output = reviewService.selectReview(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("item", output);
		return new ModelAndView("11_admin/admin_review_answer");
	}

	/** 리뷰에 남긴 답변 수정 페이지 */
	@RequestMapping(value = "/11_admin/admin_review_edit.do", method = RequestMethod.GET)
	public ModelAndView adminReviewEdit(Model model, @RequestParam(value = "reviewno", defaultValue = "0") int reviewno,
			HttpServletRequest request) {
		/** 로그인 여부 검사 */
		String adminno = "";
		HttpSession session = request.getSession();
		if (session.getAttribute("my_admin") != null) {
			adminno = (String) session.getAttribute("my_admin");
		}
		if (adminno == "") {
			return webHelper.redirect(null, "관리자로 로그인을 해주세요.");
		}

		if (reviewno == 0) {
			return webHelper.redirect(null, "리뷰 번호가 없습니다");
		}
		Review input = new Review();
		input.setReviewno(reviewno);
		RevComment commentinput = new RevComment();
		commentinput.setReviewno(reviewno);

		Review output = new Review();
		RevComment commentoutput = new RevComment();

		try {
			// 데이터 조회
			output = reviewService.selectReview(input);
			commentoutput = reviewService.admintRevcommentList(commentinput);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("item", output);
		model.addAttribute("comitem", commentoutput);
		return new ModelAndView("11_admin/admin_review_edit");
	}

	/** 리뷰에 남긴 답변 확인 페이지 */
	@RequestMapping(value = "/11_admin/admin_review_view.do", method = RequestMethod.GET)
	public ModelAndView adminReviewView(Model model, @RequestParam(value = "reviewno", defaultValue = "0") int reviewno,
			HttpServletRequest request) {
		/** 로그인 여부 검사 */
		String adminno = "";
		HttpSession session = request.getSession();
		if (session.getAttribute("my_admin") != null) {
			adminno = (String) session.getAttribute("my_admin");
		}
		if (adminno == "") {
			return webHelper.redirect(null, "관리자로 로그인을 해주세요.");
		}

		if (reviewno == 0) {
			return webHelper.redirect(null, "리뷰 번호가 없습니다");
		}
		Review input = new Review();
		input.setReviewno(reviewno);
		RevComment commentinput = new RevComment();
		commentinput.setReviewno(reviewno);

		Review output = new Review();
		RevComment commentoutput = new RevComment();

		try {
			// 데이터 조회
			output = reviewService.selectReview(input);
			commentoutput = reviewService.admintRevcommentList(commentinput);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		model.addAttribute("item", output);
		model.addAttribute("comitem", commentoutput);
		return new ModelAndView("11_admin/admin_review_view");
	}
}
