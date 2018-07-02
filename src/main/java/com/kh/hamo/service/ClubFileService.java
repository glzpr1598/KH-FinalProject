package com.kh.hamo.service;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.hamo.dao.ClubBbsInter;

@Service
public class ClubFileService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
    @Autowired
	private SqlSession sqlSession;
    
    ClubBbsInter inter;

}
