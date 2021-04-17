package com.project.laporte.service;

import java.util.List;

import com.project.laporte.model.Outuser;
import com.project.laporte.model.User;

public interface UserService {
	/** 회원가입 정보 저장 */
	public int addUser(User input) throws Exception;
	
	/** 회원 목록 조회 */
	public List<User> getUserlist(User input) throws Exception;
	/** 회원가입 정보 조회 */
	public User getUserItem(User input) throws Exception;
	
	/** 아이디 중복 검사*/
	public int getIdItem(User input) throws Exception;
	
	/** 로그인 아이디 비밀번호 검사 */
	public User checkIdPw(User input) throws Exception;
	
	/** 암호화된 비밀번호 검사 */
	public User checkPw(User input) throws Exception;
	
	/** 이메일 존재 여부 검사 */
	public User checkEmail(User input) throws Exception;
	
	/** 개인 정보 수정 */
	public int userInfoRevise(User input) throws Exception;
	
	/** 연락처 수정 */
	public int userConRevise(User input) throws Exception;
	
	/** 비밀번호 수정 */
	public int pwRevise(User input) throws Exception;
	
	/** 주소 수정*/
	public int userAddrRevise(User input) throws Exception;
	
	/** 사용한 포인트 차감 */
	public int pointRevise(User input) throws Exception;
	
	/** 탈퇴 회원 조회 */
	public List<Outuser> getOutuserList(Outuser input) throws Exception;
	
	/** 회원 삭제 */
	public int deleteUser(User input) throws Exception;
	
	/** 탈퇴 회원 저장*/
	public int addOutUser(Outuser input) throws Exception;
}
