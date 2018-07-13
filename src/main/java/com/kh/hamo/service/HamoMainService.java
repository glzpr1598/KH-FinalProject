package com.kh.hamo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.hamo.dao.HamoMainInter;
import com.kh.hamo.dto.HamoMainDTO;

@Service
public class HamoMainService {
	@Autowired SqlSession sqlSession;
	HamoMainInter inter =null;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	// 검색 값 가져오는 서비스
	public ModelAndView m08move(String search) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("search",search);
		mav.setViewName("m08");
		return mav;
	}
	// mo08move 에서 가져온 값을 보여주는 서비스
	public HashMap<String, Object> totalClubSearch(HashMap<String, String> map) {
		logger.info("종합검색 서비스 실행");
		inter = sqlSession.getMapper(HamoMainInter.class);
		ArrayList<HamoMainDTO> totalClubSearch = inter.totalClubSearch(map);
		HashMap<String, Object> result = new HashMap<>();
		result.put("list", totalClubSearch);
		return result;
	}
	//설립한 동호회 리스트
	public HashMap<String, Object> myClubList(String id) {
		logger.info("설립한 동호회 리스트 서비스 실행 : "+id);
		inter = sqlSession.getMapper(HamoMainInter.class);
		ArrayList<HamoMainDTO> myClubList = inter.myClubList(id);
		HashMap<String, Object> result = new HashMap<>();
		result.put("myClubList", myClubList);
		return result;
	}
	//가입한 동호회 리스트
	public HashMap<String, Object> myClubJoin(String id) {
		logger.info("가입한 동호회 리스트 서비스 실행 : "+id);
		inter = sqlSession.getMapper(HamoMainInter.class);
		ArrayList<HamoMainDTO> myClubJoin = inter.myClubJoin(id);
		System.out.println(myClubJoin.get(0).getClub_date());
		HashMap<String, Object> result = new HashMap<>();
		result.put("myClubJoin", myClubJoin);
		return result;
	}
	//가입한 동호회 탈퇴
	public ModelAndView myClubRemove(String myClubRemove) {
		inter = sqlSession.getMapper(HamoMainInter.class);
		int success = inter.myClubDel(myClubRemove);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("m09");
		return mav;
	}

	
	/**김응주 - 메인페이지에 동호회를 소개 (사진,소개글)*/
	public ModelAndView home(String userId) {
		inter = sqlSession.getMapper(HamoMainInter.class);
		ModelAndView mav = new ModelAndView();
		
		/*메인화면 가운데*/
		ArrayList<HamoMainDTO> list = inter.home();
		
		int n = 0;
		if(list.size()==1) {n=1;};
		if(list.size()==2) {n=2;};
		if(list.size()==3) {n=3;};
		if(list.size()==4) {n=4;};
		if(list.size()>=5) {n=5;};
		
		
		
		if(list.size()!=0) {
				int a[] = new int[n]; //int형 배열 선언
				Random r = new Random(); //객체생성
		
				for(int i=0;i<n;i++) {    //	숫자 5개를 뽑기위한 for문
					a[i] = r.nextInt(list.size()); // ( 범위 0번 ~리스트크기 ) 사이에 해당되는 숫자중 랜덤으로 하나를 뽑아 a[0]~a[4]에 저장
		
					for(int j=0;j<i;j++) { //중복제거를 위한 for문 
		
						if(a[i]==a[j])  {
							i--;
						}
						/*					현재 a[]에 저장된 랜덤숫자와 이전에 a[]에 들어간 숫자 비교
			                     ※예를 들어
			                 배열 a[3]에 숫자 6이 들어갔을때 이전에 완성된 배열 a[0],a[1],a[2]와 비교하여
			                 숫자 6이 중복되지 않을시 다음 a[4]으로 넘어가고, 중복된다면 다시 a[3]에 중복되지   
			                 않는 숫자를 넣기 위하여 i를 한번 감소한후 처음 for문으로 돌아가 다시 a[3]을 채운다			 */
					}
				}
				/*	        관심사와 동호회 사진을 가져오려면 별도의 쿼리문이 필요하기때문에 랜덤으로 뽑힌 
			        5개의 dto 만 골라서 관심사와 동호회 사진값을 뽑아오는 쿼리문 실행 후 저장				*/

		
		        for(int i=0; i<n; i++) {
		            list.get(a[i]).setClubPicture_newName(inter.SearchPicture(list.get(a[i]).getClub_id()));
		            list.get(a[i]).setInterest_interest(inter.SearchInterest(list.get(a[i]).getInterest_id()));
		            mav.addObject("list"+i ,list.get(a[i]));
		            mav.addObject("size",list.size());
		        }
		}else {
					mav.addObject("size",0);
		}
		/*인기동호회 3개*/
	    ArrayList<HamoMainDTO> list2 = inter.interestTop3();
	    mav.addObject("size2",list2.size());
	   
	    if(list2.size()>=1) {
			list2.get(0).setClubPicture_newName(inter.SearchPicture(list2.get(0).getClub_id()));
			mav.addObject("inter",list2.get(0));
		}
		if(list2.size()>=2) {
			list2.get(1).setClubPicture_newName(inter.SearchPicture(list2.get(1).getClub_id()));
			mav.addObject("inter2",list2.get(1));
		}
		if(list2.size()==3) {
			list2.get(2).setClubPicture_newName(inter.SearchPicture(list2.get(2).getClub_id()));   
			mav.addObject("inter3",list2.get(2));
		}
		
		/*맞춤동호회 3개*/
		if(userId != null) {
			String location = inter.searchLocation(userId);
			ArrayList<Integer> best = inter.searchBest(userId);
			int best1 = best.get(0);
			int best2 = best.get(1);
			int best3 = best.get(2);
			
			ArrayList<HamoMainDTO> bestClub = inter.bestClub(location,best1,best2,best3);
			
			mav.addObject("size3",bestClub.size());
			mav.addObject("userId",userId);
			
		    if(bestClub.size()>=1) {
		    	bestClub.get(0).setClubPicture_newName(inter.SearchPicture(bestClub.get(0).getClub_id()));
				mav.addObject("best1",bestClub.get(0));
			}
			if(bestClub.size()>=2) {
				bestClub.get(1).setClubPicture_newName(inter.SearchPicture(bestClub.get(1).getClub_id()));
				mav.addObject("best2",bestClub.get(1));
			}
			if(bestClub.size()>=3) {
				bestClub.get(2).setClubPicture_newName(inter.SearchPicture(bestClub.get(2).getClub_id()));   
				mav.addObject("best3",bestClub.get(2));
			}
		}
	        mav.setViewName("main");

		return mav;
	}

	//동호회 찾기
	public HashMap<String, Object> clubSearch(HashMap<String, String> map) {
		logger.info("동호회 찾기 서비스 실행");
		System.out.println(map.get("interest"));
		inter = sqlSession.getMapper(HamoMainInter.class);
		ArrayList<HamoMainDTO> clubSearch = inter.clubSearch(map);
		HashMap<String, Object> result = new HashMap<>();
		result.put("list", clubSearch);
		return result;
	}
}

