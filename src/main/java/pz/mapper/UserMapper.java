package pz.mapper;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import pz.vo.UserVo;

@MapperScan
public interface UserMapper {
	//회원가입
	int signup(UserVo vo) throws Exception;
	UserVo login(@Param("userid") String userid, @Param("pwd") String pwd) throws Exception;
	UserVo sessionLogin(@Param("userid") String userid) throws Exception;
	int updateUser(UserVo vo) throws Exception;
	int deleteUser(@Param("userid") String userid) throws Exception;
	
	int idCheck(@Param("userid") String userid) throws Exception;
	int nicknameCheck(@Param("nickname") String nickname) throws Exception;
}

