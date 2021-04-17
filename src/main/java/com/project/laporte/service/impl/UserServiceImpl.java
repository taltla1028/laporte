package com.project.laporte.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.laporte.helper.WebHelper;
import com.project.laporte.model.Outuser;
import com.project.laporte.model.User;
import com.project.laporte.service.UserService;

import lombok.extern.slf4j.Slf4j;

/** 회원 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
//->import org.springframework.stereotype.Service;
@Service
@Slf4j

public class UserServiceImpl implements UserService {

	/** MyBatis */
	// -->import org.apache.ibatis.session.Sqlsession
	@Autowired
	SqlSession sqlSession;

	@Autowired
	WebHelper webHelper;

	/** 회원가입 정보 저장 */
	@Override
	public int addUser(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("UserMapper.insertUser", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		return result;
	}

	/** 회원 목록 조회 */

	@Override
	public List<User> getUserlist(User input) throws Exception {
		List<User> result =null;

		try {
			result = sqlSession.selectList("UserMapper.selectUserList", input);

			if(result == null) {
				throw new NullPointerException("result == null");
			}
			}catch(NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("조회된 데이터가 없습니다.");
			}catch(Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 조회에 실패했습니다.");
			}
			return result;
	}

	/** 회원가입 정보 조회 */
	@Override
	public User getUserItem(User input) throws Exception {
		User result = null;

		try {
			result = sqlSession.selectOne("UserMapper.selectItem", input);

			if (result == null) {
				throw new NullPointerException("result == null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/** 아이디 중복 검사 */
	@Override
	public int getIdItem(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("UserMapper.idCheck", input);

			if (result > 0) {
				result = 1;
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}

		return result;
	}

	/** 로그인 아이디 비밀번호 검사 */
	@Override
	public User checkIdPw(User input) throws Exception {
		//결과를 리턴할 객체 생성
		User result = null;

		try {
			result = sqlSession.selectOne("UserMapper.idPwCheck", input);
			if (result == null) {
				throw new NullPointerException("result == null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("비밀번호가 잘못 되었습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/** 암호화된 비밀번호 검사 */
	@Override
	public User checkPw(User input) throws Exception {
		User result = null;

		try {
			result = sqlSession.selectOne("UserMapper.pwCheck", input);

			if(result == null) {
				throw new NullPointerException("result == null");
			}
		}catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("존재하지 않는 아이디입니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/** 이메일 존재 여부 검사 */
	@Override
	public User checkEmail(User input) throws Exception {
		User result = null;

		try {
			result = sqlSession.selectOne("UserMapper.emailCheck", input);

			if(result == null) {
				throw new NullPointerException("result == null");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("존재하지 않는 이메일입니다.");
		}catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
	}
		return result;
}

	/** 비밀번호 수정 */
	@Override
	public int pwRevise(User input) throws Exception {
		//결과를 리턴할 객체 생성
		int result = 0;

		try {
			//입력값을 update하는 Query를 연결하기 위해 mapper의 id와 연결
			result = sqlSession.update("UserMapper.pwRevise", input);

			if(result == 0) {
				throw new NullPointerException("result = 0");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}

	/** 개인 정보 수정 */
	@Override
	public int userInfoRevise(User input) throws Exception {
		int result = 0;
		try {
			result= sqlSession.update("UserMapper.userInfoRevise", input);

			if(result == 0) {
				throw new NullPointerException("result == 0");
			}
			}catch(NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("조회된 데이터가 없습니다.");
			}catch(Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 조회에 실패했습니다.");
			}
			return result;
	}

	/** 연락처 수정 */
	@Override
	public int userConRevise(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("UserMapper.userConRevise", input);

			if(result == 0) {
				throw new NullPointerException("result == 0");
			}
			}catch(NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("조회된 데이터가 없습니다.");
			}catch(Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 조회에 실패했습니다.");
			}
			return result;
	}

	/** 주소 수정*/
	@Override
	public int userAddrRevise(User input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("UserMapper.addrRevise", input);

			if(result == 0) {
				throw new NullPointerException("result == 0");
			}
			}catch(NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("조회된 데이터가 없습니다.");
			}catch(Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 조회에 실패했습니다.");
			}
			return result;
	}

	/** 사용한 포인트 차감하기 */
	@Override
	public int pointRevise(User input) throws Exception {
		int result = 0;

		try {
			 result = sqlSession.update("UserMapper.pointRevise",input);

			 if(result == 0) {
				 throw new NullPointerException("result == 0");
			 }
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}


	/** 탈퇴 회원 목록 조회 */
	@Override
	public List<Outuser> getOutuserList(Outuser input) throws Exception {
		List<Outuser> result = null;

		try {
			result = sqlSession.selectList("OutuserMapper.selectOutuserList", input);

			if(result == null) {
				throw new NullPointerException("result == null");
			}

		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/** 회원 삭제 */
	@Override
	public int deleteUser(User input) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;

		try {
			//회원 삭제 전 user를 참조하고 있는 reserve 테이블의 userno을 null로 수정
			sqlSession.delete("ReserveMapper.unsetUsernoResv", input);

			//회원 삭제 전 user를 참조하고 있는 review 테이블의 userno을 null로 수정
			sqlSession.delete("ReviewMapper.unsetUsernoRev", input);

			//회원 삭제 전 user를 참조하고 있는 cart 테이블의 userno을 null로 수정
			sqlSession.delete("CartMapper.unsetUsernoCart", input);

			//회원 삭제 전 user를 참조하고 있는 wishlist 테이블의 userno을 null로 수정
			sqlSession.delete("WishlistMapper.unsetUsernoWish", input);

			//회원 삭제 전 user를 참조하고 있는 orderlist 테이블의 userno을 null로 수정
			sqlSession.delete("OrderlistMapper.unsetUsernoOrd", input);

			//회원 삭제 전 user를 참조하고 있는 delivery 테이블의 userno을 null로 수정
			sqlSession.delete("DeliveryMapper.unsetUsernoDel", input);

			//회원 삭제 전 user를 참조하고 있는 userscoupon 테이블의 userno을 null로 수정
			sqlSession.delete("UserscouponMapper.unsetUsernoUsc", input);

			result = sqlSession.delete("UserMapper.deleteUser", input);

			if(result ==0) {
				throw new NullPointerException("result == 0");
			}

		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	/** 탈퇴 회원 저장*/
	@Override
	public int addOutUser(Outuser input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("OutuserMapper.insertOutuser", input);

			if(result == 0) {
				throw new NullPointerException("result==0");
			}
			}catch(NullPointerException e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("조회된 데이터가 없습니다.");
			}catch(Exception e) {
				log.error(e.getLocalizedMessage());
				throw new Exception("데이터 조회에 실패했습니다.");
			}
			return result;
		}
	}
